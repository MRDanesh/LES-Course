function [d] = grad_u(i,u,h,Nx)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
if i>1 && i<Nx
d=(u(i+1,1)-u(i-1,1))/(2*h);
end
if i==1
   d=(u(i+1,1)-u(i-1+Nx,1))/(2*h);
end
if i==Nx
   d=(u(i+1-Nx,1)-u(i-1,1))/(2*h);
end

end

