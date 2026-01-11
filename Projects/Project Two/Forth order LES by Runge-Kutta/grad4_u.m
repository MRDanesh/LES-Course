function [d] = grad4_u(i,u,h,Nx)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if i>2 && i<Nx-1
d=(-u(i+2)+8*u(i+1,1)-8*u(i-1,1)+u(i-2))/(12*h);
end
if i==1
   d=(-u(i+2,1)+8*u(i+1,1)-8*u(i-1+Nx,1)+u(i-2+Nx,1))/(12*h);
end

if i==2
   d=(-u(i+2,1)+8*u(i+1,1)-8*u(i-1,1)+u(i-2+Nx,1))/(12*h);
end

if i==Nx
   d=(-u(i+2-Nx,1)+8*u(i+1-Nx,1)-8*u(i-1,1)+u(i-2,1))/(12*h);
end

if i==Nx-1
   d=(-u(i+2-Nx,1)+8*u(i+1,1)-8*u(i-1,1)+u(i-2,1))/(12*h);
end

end

