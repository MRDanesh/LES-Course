clear all; clc; close all; t = cputime;

%Input Parameters***********************************************************
%visc = Kinematic Viscosity; D: Diffusivity of Noise; beta: Spectrum slope
nu = 1; D = 1e-6; beta = -0.75;
%Nx:    # Grid Points; dx: Grid Spacing; NSteps: Total # Iterations
%dt:    Time Increment; NDNS: # DNS grid points
Nx  = 33; h = 2*pi/Nx; NSteps = 121; deltat = 0.005; NDNS = 8192;
%Ninfo: Info outpout frequency on screen; Nstat: Statistics outpout frequency 
Ninfo = 1; Nstat = 1;
%A few files for writing output
outpath = ['.',filesep,'validation_',int2str(Nx),filesep];
[~,~,~] = mkdir(outpath);

file_u  = fopen([outpath,'valid_',int2str(Nx),'_U.out'],'w');

%Initial velocity field******************************************************
randn('state',0);   
x=0:h:2*pi-h;
u=zeros(Nx,1);
for i=1:Nx
    xx=(i)*h;
    u(i,1)=10*sin(xx);
end
%Advancing in time***********************************************************
for s = 1:NSteps

    for j=1
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2+Nx,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2+Nx,1))^2)/(16*h);
         f1(j,1)  = diff1(j,1) - conv1(j,1);
     u2(j,1) = u(j,1)+(1/2)*deltat*f1(j,1);
    end
    for j=2
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2+Nx,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2+Nx,1))^2)/(16*h);
          f1(j,1)  = diff1(j,1) - conv1(j,1);
     u2(j,1) = u(j,1)+(1/2)*deltat*f1(j,1);
    end
    
    for j=3:Nx-2
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);  
         f1(j,1)  = diff1(j,1) - conv1(j,1) ;
     u2(j,1) = u(j,1)+(1/2)*deltat*f1(j,1);
    end

    
    for j=Nx-1
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2-Nx,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2-Nx,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);
          f1(j,1)  = diff1(j,1) - conv1(j,1) ;
     u2(j,1) = u(j,1)+(1/2)*deltat*f1(j,1);
    end
    for j=Nx
        diff1(j,1)= (4/3)*nu*( u(j+1-Nx,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2-Nx,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1-Nx,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2-Nx,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);
         f1(j,1)  = diff1(j,1) - conv1(j,1) ;
     u2(j,1) = u(j,1)+(1/2)*deltat*f1(j,1);
    end
    
    
    
     
    
    %%
   
    
    
    for j=1
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2+Nx,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2+Nx,1))^2)/(16*h);
        f2(j,1)  = diff2(j,1) - conv2(j,1) ;
     u3(j,1) = u(j,1)+(1/2)*deltat*f2(j,1);
    end
    for j=2
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2+Nx,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2+Nx,1))^2)/(16*h);
        f2(j,1)  = diff2(j,1) - conv2(j,1) ;
     u3(j,1) = u(j,1)+(1/2)*deltat*f2(j,1);
    end
    
    for j=3:Nx-2
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);  
       f2(j,1)  = diff2(j,1) - conv2(j,1) ;
     u3(j,1) = u(j,1)+(1/2)*deltat*f2(j,1);
    end

    
    for j=Nx-1
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2-Nx,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2-Nx,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);
       f2(j,1)  = diff2(j,1) - conv2(j,1) ;
     u3(j,1) = u(j,1)+(1/2)*deltat*f2(j,1);
    end
    for j=Nx
        diff2(j,1)= (4/3)*nu*( u2(j+1-Nx,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2-Nx,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1-Nx,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2-Nx,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);
        f2(j,1)  = diff2(j,1) - conv2(j,1) ;
     u3(j,1) = u(j,1)+(1/2)*deltat*f2(j,1);
    end
    

     

    %%
    
     
    
    for j=1
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2+Nx,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2+Nx,1))^2)/(16*h);
        f3(j,1)  = diff3(j,1) - conv3(j,1) ;
     u4(j,1) = u(j,1)+(1/2)*deltat*f3(j,1);
    end
    for j=2
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2+Nx,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2+Nx,1))^2)/(16*h);
       f3(j,1)  = diff3(j,1) - conv3(j,1);
     u4(j,1) = u(j,1)+(1/2)*deltat*f3(j,1);
    end
    
    for j=3:Nx-2
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);   
       f3(j,1)  = diff3(j,1) - conv3(j,1);
     u4(j,1) = u(j,1)+(1/2)*deltat*f3(j,1);
    end

    
    for j=Nx-1
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2-Nx,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2-Nx,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);
        f3(j,1)  = diff3(j,1) - conv3(j,1) ;
     u4(j,1) = u(j,1)+(1/2)*deltat*f3(j,1);
    end
    for j=Nx
        diff3(j,1)= (4/3)*nu*( u3(j+1-Nx,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2-Nx,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1-Nx,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2-Nx,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);
        f3(j,1)  = diff3(j,1) - conv3(j,1);
     u4(j,1) = u(j,1)+(1/2)*deltat*f3(j,1);
    end
    

     
    
    %%
    
    for j=1
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2+Nx,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2+Nx,1))^2)/(16*h);
        f4(j,1)  = diff4(j,1) - conv4(j,1) ;
    end
    for j=2
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2+Nx,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2+Nx,1))^2)/(16*h);
        f4(j,1)  = diff4(j,1) - conv4(j,1);
    end
    
    for j=3:Nx-2
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h); 
         f4(j,1)  = diff4(j,1) - conv4(j,1) ;
    end

    
    for j=Nx-1
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2-Nx,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2-Nx,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h);
         f4(j,1)  = diff4(j,1) - conv4(j,1) ;
    end
    for j=Nx
        diff4(j,1)= (4/3)*nu*( u4(j+1-Nx,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2-Nx,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1-Nx,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2-Nx,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h);
         f4(j,1)  = diff4(j,1) - conv4(j,1) ;
    end
    %%
    
    %Update velocity*********************************************************
    for j=1:Nx
    unew(j,1) = u(j,1)+deltat*(1/6)*(f1(j,1)+2*f2(j,1)+2*f3(j,1)+f4(j,1));
    u(j,1)=unew(j,1);
    end
  
        %Check convergence
    if sum(isnan(u))>0 break; end;
    
    %Output Info**************************************************
    if rem(s,Ninfo) == 0
        CFL         = max(abs(u))*deltat/h;            
        KE          = 0.5*var(u);
        t           = cputime-t; 
        fprintf('%d\t%f\t%f\t%f\t%f\t%f\t%f\n',s,s*deltat,KE,CFL,max(u),min(u),t);
        t           = cputime;
    end
    
    %Output Space-Time Data**************************************************       
    if rem(s,Nstat) == 0
        fprintf(file_u,'%f\t',u); fprintf(file_u,'\n');
        
        %other stat computation and output   
    end
    Time=s*deltat
end