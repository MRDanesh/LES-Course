
clear all; clc; close all; t = cputime;

%Input Parameters***********************************************************
%visc = Kinematic Viscosity; D: Diffusivity of Noise; beta: Spectrum slope
nu = 1e-5; D = 1e-6; beta = -0.75;
%Nx:    # Grid Points; dx: Grid Spacing; NSteps: Total # Iterations
%dt:    Time Increment; NDNS: # DNS grid points
Nx  = 512; h = 2*pi/Nx; NSteps = 2e6; dt = 1e-4; NDNS = 8192;
%Ninfo: Info outpout frequency on screen; Nstat: Statistics outpout frequency 
Ninfo = 100; Nstat = 1000;
%A few files for writing output
outpath = ['.',filesep,'BurgersLES_',int2str(Nx),filesep];
[~,~,~] = mkdir(outpath);

file_u  = fopen([outpath,'Wongsecond_',int2str(Nx),'_U.out'],'w');

%Initial velocity field******************************************************
randn('state',0);               
u=zeros(Nx,1);
diff =zeros(Nx,1);
conv = zeros(Nx,1);
ff = zeros(Nx,1);
RSG = zeros(Nx,1);
RHS= zeros(Nx,1);
%Advancing in time***********************************************************
for s = 1:NSteps


    f   = sqrt(2*D/dt)*SBE_FBM(beta,NDNS)';
    for j=1:512
        ff(j)=sum (f((j-1)*16+1:j*16))/16;
    end

    for j=1
        diff(j,1)= nu*( u(j+1,1)-2*u(j,1)+u(j-1+Nx,1) )/(h*h); 
        conv(j,1)=  ( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1+Nx,1))^2)/(8*h)  ;
    end
    for j=2
        diff(j,1)= nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h); 
        conv(j,1)=  ( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)  ; 
    end
    
    for j=3:Nx-2
        diff(j,1)= nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h); 
        conv(j,1)=  ( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)  ;                
    end

    
    for j=Nx-1
        diff(j,1)= nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h); 
        conv(j,1)=  ( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)  ; 
    end
    for j=Nx
        diff(j,1)= nu*( u(j+1-Nx,1)-2*u(j,1)+u(j-1,1) )/(h*h); 
        conv(j,1)=  ( (u(j,1)+u(j+1-Nx,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)  ; 
    end
    %%%% LES Modeling %%%%
   
    N11(1)=-2*(h^(4/3))*filter_Boundary((grad_u(Nx,u,h,Nx)),(grad_u(1,u,h,Nx)),(grad_u(2,u,h,Nx)))*(2^(4/3)-1);
    
    L11(1)=filter_Boundary(u(Nx,1)*u(Nx,1),u(1,1)*u(1,1),u(2,1)*u(2,1))-...
            filter_Boundary(u(Nx,1),u(1,1),u(2,1))*filter_Boundary(u(Nx,1),u(1,1),u(2,1));
        
    N11(Nx)=-2*(h^(4/3))*filter_Boundary((grad_u(1,u,h,Nx)),(grad_u(Nx,u,h,Nx)),(grad_u(Nx-1,u,h,Nx)))*(2^(4/3)-1);

    L11(Nx)=filter_Boundary(u(1,1)*u(1,1),u(Nx,1)*u(Nx,1),u(Nx-1,1)*u(Nx-1,1))-...
            filter_Boundary(u(1,1),u(Nx,1),u(Nx-1,1))*filter_Boundary(u(1,1),u(Nx,1),u(Nx-1,1));   
        
    for j=2:Nx-1
        N11(j)=-2*(h^(4/3))*filter_Boundary((grad_u(j-1,u,h,Nx)),(grad_u(j,u,h,Nx)),(grad_u(j+1,u,h,Nx)))*(2^(4/3)-1);
        
        L11(j)=filter_2(u(j-1,1)*u(j-1,1),u(j,1)*u(j,1),u(j+1,1)*u(j+1,1))-...
            filter_2(u(j-1,1),u(j,1),u(j+1,1))*filter_2(u(j-1,1),u(j,1),u(j+1,1));
    end
    pp=0;
    dd=0;
    for j=1:Nx
        pp=pp+L11(j)*N11(j);
        dd=dd+N11(j)*N11(j);
    end
    Cw(s)=pp/dd; 
    Cw(1)=0;
    
    for j=2:Nx-1
    tau(j)=-2*Cw(s)*(h^(4/3))*(u(j+1,1)-u(j-1,1))/(2*h);
    end
    
    for j=1
    tau(j)=-2*Cw(s)*(h^(4/3))*(u(j+1,1)-u(j-1+Nx,1) )/(2*h);
    end
    
    for j=Nx
    tau(j)=-2*Cw(s)*(h^(4/3))*(u(j+1-Nx,1)-u(j-1,1) )/(2*h);
    end
    
    for j=2:Nx-1
        
        RSG(j,1)=0.5* (tau(j+1)-tau(j-1) )/(2*h);
    end
    
    for j=1
        
        RSG(j,1)=0.5* (tau(j+1)-tau(j-1+Nx) )/(2*h);
    end
    
    for j=Nx
        
        RSG(j,1)=0.5* (tau(j+1-Nx)-tau(j-1) )/(2*h);
    end
    
    
    %Right Hand Side*********************************************************
	for j=1:Nx
    RHS(j,1) = diff(j,1) - conv(j,1) + ff(j,1) - RSG(j,1);
    end
    %Update velocity*********************************************************
    if s == 1
        unew = u + dt*RHS;                              %Euler
    else    
        unew = u + dt*(1.5*RHS - 0.5*RHSp);             %AB2
    end
    u     = unew; RHSp = RHS;
    
    %Check convergence
    if sum(isnan(u))>0 break; end
    
    %Output Info**************************************************
    if rem(s,Ninfo) == 0
        CFL         = max(abs(u))*dt/h;            
        KE          = 0.5*var(u);
        t           = cputime-t; 
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n',s,s*dt,KE,CFL,max(u),min(u),t);
        t           = cputime;
    end
    
    %Output Space-Time Data**************************************************       
    if rem(s,Nstat) == 0
        fprintf(file_u,'%f\t',u); fprintf(file_u,'\n');
        
    end
    Time=s*dt
end
