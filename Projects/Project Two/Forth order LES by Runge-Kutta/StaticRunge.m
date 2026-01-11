
clear all; clc; close all; t = cputime;

%Input Parameters***********************************************************
%visc = Kinematic Viscosity; D: Diffusivity of Noise; beta: Spectrum slope
nu = 1e-5; D = 1e-6; beta = -0.75;
%Nx:    # Grid Points; dx: Grid Spacing; NSteps: Total # Iterations
%dt:    Time Increment; NDNS: # DNS grid points
Nx  = 512; h = 2*pi/Nx; NSteps = 2e6; deltat = 1e-4; NDNS = 8192;
%Ninfo: Info outpout frequency on screen; Nstat: Statistics outpout frequency 
Ninfo = 100; Nstat = 1000;

%A few files for writing output
outpath = ['.',filesep,'LES_Static',int2str(Nx),filesep];
[~,~,~] = mkdir(outpath);

file_u  = fopen([outpath,'Static_',int2str(Nx),'_U.out'],'w');

%Initial velocity field******************************************************
randn('state',0);                  
u=zeros(Nx,1);
diff1 =zeros(Nx,1);
conv1 = zeros(Nx,1);
ff = zeros(Nx,1); 
RSG = zeros(Nx,1);
diff2 =zeros(Nx,1);
conv2 = zeros(Nx,1);
diff3 =zeros(Nx,1);
conv3 = zeros(Nx,1);
diff4 =zeros(Nx,1);
conv4 = zeros(Nx,1);

%Advancing in time***********************************************************
for s = 1:NSteps
    
    f   = sqrt(2*D/deltat)*SBE_FBM(beta,NDNS)';
    for j=1:512
        ff(j)=sum (f((j-1)*16+1:j*16))/16;
    end
 
    for j=1
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2+Nx,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2+Nx,1))^2)/(16*h);
    end
    for j=2
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2+Nx,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2+Nx,1))^2)/(16*h);
    end
    
    for j=3:Nx-2
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);                
    end

    
    for j=Nx-1
        diff1(j,1)= (4/3)*nu*( u(j+1,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2-Nx,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2-Nx,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);
    end
    for j=Nx
        diff1(j,1)= (4/3)*nu*( u(j+1-Nx,1)-2*u(j,1)+u(j-1,1) )/(h*h)-(1/3)*nu*( u(j+2-Nx,1)-2*u(j,1)+u(j-2,1) )/(4*h*h); 
        conv1(j,1)=  (4/3)*( (u(j,1)+u(j+1-Nx,1))^2 - (u(j,1)+u(j-1,1))^2)/(8*h)-...
            (1/3)*( (u(j,1)+u(j+2-Nx,1))^2 - (u(j,1)+u(j-2,1))^2)/(16*h);
    end
    
    
    %%% LES Modeling %%%%
    
    Cs_1=0.2;
    
    for j=3:Nx-2
    tau_1(j)=-2*Cs_1*h*h*abs(( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2,1) )/(12*h))*( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2,1) )/(12*h);
    end
    
    for j=1
    tau_1(j)=-2*Cs_1*h*h*abs(( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1+Nx,1) +u(j-2+Nx,1) )/(12*h))*( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1+Nx,1) +u(j-2+Nx,1) )/(12*h);
    end
    
     for j=2
    tau_1(j)=-2*Cs_1*h*h*abs(( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2+Nx,1) )/(12*h))*( -u(j+2,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2+Nx,1) )/(12*h);
     end
    
     for j=Nx-1
    tau_1(j)=-2*Cs_1*h*h*abs(( -u(j+2-Nx,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2,1) )/(12*h))*( -u(j+2-Nx,1)+  8*u(j+1,1)-8*u(j-1,1) +u(j-2,1) )/(12*h);
    end
     
     for j=Nx
    tau_1(j)=-2*Cs_1*h*h*abs(( -u(j+2-Nx,1)+  8*u(j+1-Nx,1)-8*u(j-1,1) +u(j-2,1) )/(12*h))*( -u(j+2-Nx,1)+  8*u(j+1-Nx,1)-8*u(j-1,1) +u(j-2,1) )/(12*h);
    end
    
    for j=3:Nx-2
        
        RSG_1(j,1)=0.5* ( -tau_1(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_1(j-2) )/(12*h);
    end
    
    for j=1
        
        RSG_1(j,1)=0.5* ( -tau_1(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1+Nx)+ tau_1(j-2+Nx) )/(12*h);
    end
    
    for j=2
        
        RSG_1(j,1)=0.5* ( -tau_1(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_1(j-2+Nx) )/(12*h);
    end
    
    for j=Nx-1
        
        RSG_1(j,1)=0.5* ( -tau_1(j+2-Nx)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_1(j-2) )/(12*h);
    end
    
    for j=Nx
        
        RSG_1(j,1)=0.5* ( -tau_1(j+2-Nx)+ 8*tau_1(j+1-Nx)-8*tau_1(j-1)+ tau_1(j-2) )/(12*h);
    end
    
   for i=1:Nx
    f1(i,1) = diff1(i,1) - conv1(i,1) + ff(i,1) - RSG_1(i,1);
    end
    for i=1:Nx
    u2(i,1)=u(i,1)+(1/2)*deltat*f1(i,1);
    end
    
    %%
   
    for j=1
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2+Nx,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2+Nx,1))^2)/(16*h);
    end
    for j=2
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2+Nx,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2+Nx,1))^2)/(16*h);
    end
    
    for j=3:Nx-2
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);                
    end

    
    for j=Nx-1
        diff2(j,1)= (4/3)*nu*( u2(j+1,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2-Nx,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2-Nx,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);
    end
    for j=Nx
        diff2(j,1)= (4/3)*nu*( u2(j+1-Nx,1)-2*u2(j,1)+u2(j-1,1) )/(h*h)-(1/3)*nu*( u2(j+2-Nx,1)-2*u2(j,1)+u2(j-2,1) )/(4*h*h); 
        conv2(j,1)=  (4/3)*( (u2(j,1)+u2(j+1-Nx,1))^2 - (u2(j,1)+u2(j-1,1))^2)/(8*h)-...
            (1/3)*( (u2(j,1)+u2(j+2-Nx,1))^2 - (u2(j,1)+u2(j-2,1))^2)/(16*h);
    end
    
    
    %%% LES Modeling %%%%
    
    
   
    Cs_2=0.2;
    
    for j=3:Nx-2
    tau_2(j)=-2*Cs_2*h*h*abs(( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h))*( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h);
    end
    
    for j=1
    tau_2(j)=-2*Cs_2*h*h*abs(( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1+Nx,1) +u2(j-2+Nx,1) )/(12*h))*( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1+Nx,1) +u2(j-2+Nx,1) )/(12*h);
    end
    
     for j=2
    tau_2(j)=-2*Cs_2*h*h*abs(( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2+Nx,1) )/(12*h))*( -u2(j+2,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2+Nx,1) )/(12*h);
     end
    
     for j=Nx-1
    tau_2(j)=-2*Cs_2*h*h*abs(( -u2(j+2-Nx,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h))*( -u2(j+2-Nx,1)+  8*u2(j+1,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h);
    end
     
     for j=Nx
    tau_2(j)=-2*Cs_2*h*h*abs(( -u2(j+2-Nx,1)+  8*u2(j+1-Nx,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h))*( -u2(j+2-Nx,1)+  8*u2(j+1-Nx,1)-8*u2(j-1,1) +u2(j-2,1) )/(12*h);
    end
    
    for j=3:Nx-2
        
        RSG_2(j,1)=0.5* ( -tau_2(j+2)+ 8*tau_2(j+1)-8*tau_2(j-1)+ tau_2(j-2) )/(12*h);
    end
    
    for j=1
        
        RSG_2(j,1)=0.5* ( -tau_2(j+2)+ 8*tau_2(j+1)-8*tau_2(j-1+Nx)+ tau_2(j-2+Nx) )/(12*h);
    end
    
    for j=2
        
        RSG_2(j,1)=0.5* ( -tau_2(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_2(j-2+Nx) )/(12*h);
    end
    
    for j=Nx-1
        
        RSG_2(j,1)=0.5* ( -tau_2(j+2-Nx)+ 8*tau_2(j+1)-8*tau_2(j-1)+ tau_2(j-2) )/(12*h);
    end
    
    for j=Nx
        
        RSG_2(j,1)=0.5* ( -tau_2(j+2-Nx)+ 8*tau_2(j+1-Nx)-8*tau_2(j-1)+ tau_2(j-2) )/(12*h);
    end
    

    
    
     for i=1:Nx
     f2(i,1) = diff2(i,1) - conv2(i,1) + ff(i,1) - RSG_2(i,1);
     end
     for i=1:Nx
     u3(i,1)=u(i,1)+(1/2)*deltat*f2(i,1);
     end
    %%
    
     
    
    for j=1
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2+Nx,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2+Nx,1))^2)/(16*h);
    end
    for j=2
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2+Nx,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2+Nx,1))^2)/(16*h);
    end
    
    for j=3:Nx-2
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);                
    end

    
    for j=Nx-1
        diff3(j,1)= (4/3)*nu*( u3(j+1,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2-Nx,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2-Nx,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);
    end
    for j=Nx
        diff3(j,1)= (4/3)*nu*( u3(j+1-Nx,1)-2*u3(j,1)+u3(j-1,1) )/(h*h)-(1/3)*nu*( u3(j+2-Nx,1)-2*u3(j,1)+u3(j-2,1) )/(4*h*h); 
        conv3(j,1)=  (4/3)*( (u3(j,1)+u3(j+1-Nx,1))^2 - (u3(j,1)+u3(j-1,1))^2)/(8*h)-...
            (1/3)*( (u3(j,1)+u3(j+2-Nx,1))^2 - (u3(j,1)+u3(j-2,1))^2)/(16*h);
    end
    
    
    
    %%%% LES Modeling %%%%%%%
    
    
     
    Cs_3=0.2;
    
    for j=3:Nx-2
    tau_3(j)=-2*Cs_3*h*h*abs(( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h))*( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h);
    end
    
    for j=1
    tau_3(j)=-2*Cs_3*h*h*abs(( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1+Nx,1) +u3(j-2+Nx,1) )/(12*h))*( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1+Nx,1) +u3(j-2+Nx,1) )/(12*h);
    end
    
     for j=2
    tau_3(j)=-2*Cs_3*h*h*abs(( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2+Nx,1) )/(12*h))*( -u3(j+2,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2+Nx,1) )/(12*h);
     end
    
     for j=Nx-1
    tau_3(j)=-2*Cs_3*h*h*abs(( -u3(j+2-Nx,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h))*( -u3(j+2-Nx,1)+  8*u3(j+1,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h);
    end
     
     for j=Nx
    tau_3(j)=-2*Cs_3*h*h*abs(( -u3(j+2-Nx,1)+  8*u3(j+1-Nx,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h))*( -u3(j+2-Nx,1)+  8*u3(j+1-Nx,1)-8*u3(j-1,1) +u3(j-2,1) )/(12*h);
    end
    
    for j=3:Nx-2
        
        RSG_3(j,1)=0.5* ( -tau_3(j+2)+ 8*tau_3(j+1)-8*tau_3(j-1)+ tau_3(j-2) )/(12*h);
    end
    
    for j=1
        
        RSG_3(j,1)=0.5* ( -tau_3(j+2)+ 8*tau_3(j+1)-8*tau_3(j-1+Nx)+ tau_3(j-2+Nx) )/(12*h);
    end
    
    for j=2
        
        RSG_3(j,1)=0.5* ( -tau_3(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_3(j-2+Nx) )/(12*h);
    end
    
    for j=Nx-1
        
        RSG_3(j,1)=0.5* ( -tau_3(j+2-Nx)+ 8*tau_3(j+1)-8*tau_3(j-1)+ tau_3(j-2) )/(12*h);
    end
    
    for j=Nx
        
        RSG_3(j,1)=0.5* ( -tau_3(j+2-Nx)+ 8*tau_3(j+1-Nx)-8*tau_3(j-1)+ tau_3(j-2) )/(12*h);
    end
    
    
     for i=1:Nx
     f3(i,1) = diff3(i,1) - conv3(i,1) + ff(i,1) - RSG_3(i,1);
     end
     for i=1:Nx
     u4(i,1)=u(i,1)+(1/2)*deltat*f3(i,1);
     end
    %%
    
    for j=1
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1+Nx,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2+Nx,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1+Nx,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2+Nx,1))^2)/(16*h);
    end
    for j=2
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2+Nx,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2+Nx,1))^2)/(16*h);
    end
    
    for j=3:Nx-2
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h);                
    end

    
    for j=Nx-1
        diff4(j,1)= (4/3)*nu*( u4(j+1,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2-Nx,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2-Nx,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h);
    end
    for j=Nx
        diff4(j,1)= (4/3)*nu*( u4(j+1-Nx,1)-2*u4(j,1)+u4(j-1,1) )/(h*h)-(1/3)*nu*( u4(j+2-Nx,1)-2*u4(j,1)+u4(j-2,1) )/(4*h*h); 
        conv4(j,1)=  (4/3)*( (u4(j,1)+u4(j+1-Nx,1))^2 - (u4(j,1)+u4(j-1,1))^2)/(8*h)-...
            (1/3)*( (u4(j,1)+u4(j+2-Nx,1))^2 - (u4(j,1)+u4(j-2,1))^2)/(16*h);
    end
    
    %%% LES Modeling %%%%%
    
    
     
    Cs_4=0.2;
    
    for j=3:Nx-2
    tau_4(j)=-2*Cs_4*h*h*abs(( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h))*( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h);
    end
    
    for j=1
    tau_4(j)=-2*Cs_4*h*h*abs(( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1+Nx,1) +u4(j-2+Nx,1) )/(12*h))*( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1+Nx,1) +u4(j-2+Nx,1) )/(12*h);
    end
    
     for j=2
    tau_4(j)=-2*Cs_4*h*h*abs(( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2+Nx,1) )/(12*h))*( -u4(j+2,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2+Nx,1) )/(12*h);
     end
    
     for j=Nx-1
    tau_4(j)=-2*Cs_4*h*h*abs(( -u4(j+2-Nx,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h))*( -u4(j+2-Nx,1)+  8*u4(j+1,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h);
    end
     
     for j=Nx
    tau_4(j)=-2*Cs_4*h*h*abs(( -u4(j+2-Nx,1)+  8*u4(j+1-Nx,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h))*( -u4(j+2-Nx,1)+  8*u4(j+1-Nx,1)-8*u4(j-1,1) +u4(j-2,1) )/(12*h);
    end
    
    for j=3:Nx-2
        
        RSG_4(j,1)=0.5* ( -tau_4(j+2)+ 8*tau_4(j+1)-8*tau_4(j-1)+ tau_4(j-2) )/(12*h);
    end
    
    for j=1
        
        RSG_4(j,1)=0.5* ( -tau_4(j+2)+ 8*tau_4(j+1)-8*tau_4(j-1+Nx)+ tau_4(j-2+Nx) )/(12*h);
    end
    
    for j=2
        
        RSG_4(j,1)=0.5* ( -tau_4(j+2)+ 8*tau_1(j+1)-8*tau_1(j-1)+ tau_4(j-2+Nx) )/(12*h);
    end
    
    for j=Nx-1
        
        RSG_4(j,1)=0.5* ( -tau_4(j+2-Nx)+ 8*tau_4(j+1)-8*tau_4(j-1)+ tau_4(j-2) )/(12*h);
    end
    
    for j=Nx
        
        RSG_4(j,1)=0.5* ( -tau_4(j+2-Nx)+ 8*tau_4(j+1-Nx)-8*tau_4(j-1)+ tau_4(j-2) )/(12*h);
    end
    %%
   
   for i=1:Nx
    f4(i,1) = diff4(i,1) - conv4(i,1) + ff(i,1) - RSG_4(i,1);
   end
    
    %Update velocity*********************************************************
     unew = u+deltat*(1/6)*(f1+2*f2+2*f3+f4);
     u=unew;
    %%
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