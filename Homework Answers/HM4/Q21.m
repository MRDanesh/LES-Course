clc
clear
N=32;
for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=2;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=6;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=9;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=12;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=14;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=15;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   for b=1:1:N/2
    h(b)=2*8e-3/N*(b);
    j=16;
    k(b)=2*pi*(j-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
    sigma(b) = abs(1 + (landa(b)*h(b)) + ((landa(b)*h(b))^2)/2 + ((landa(b)*h(b))^3)/6 + ((landa(b)*h(b))^4)/24);

end
   plot(h,sigma);
   hold on;
   
   
   xlabel('h')
   ylabel('l sigma l')
   
   