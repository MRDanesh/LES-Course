clc
clear
N=32;
h=0.001;
for b=1:1:N
    x(b)=1/31*(b-1);
end

for b=1:1:N
   if x(b)<0.4
       uu_0(b)=1-25*(x(b)-0.2)^2;
   else  
    uu_0(b)=0;
   end
end
u_0=fft(uu_0);
uf0 = ifft(u_0,N);

for b=1:1:N/2
    k(b)=2*pi*(b-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
end
for b=N/2+1:1:N
    k(b)=2*pi*(+b-N-1);
    landa(b) = -(i*k(b)+0.05*k(b)^2);
end

for b = 1:1:N
     uu1(b)=ode45(@(t,ut) landa(b).*ut,[0:h:0.25],u_0(b));
end

for b = 1:1:N   
     u1(b) = uu1(b).y(end); 
end
u1(N/2+1)=0;
uf1 = ifft(u1);


for b = 1:1:N
     uu2(b)=ode45(@(t,ut) landa(b).*ut,[0.25:h:0.5],u1(b));
end

for b = 1:1:N   
     u2(b) = uu2(b).y(end); 
end
u2(N/2+1)=0;
uf2 = ifft(u2);




for b = 1:1:N
     uu3(b)=ode45(@(t,ut) landa(b).*ut,[0.5:h:0.75],u2(b));
end

for b = 1:1:N   
     u3(b) = uu3(b).y(end); 
end
u3(N/2+1)=0;
uf3 = ifft(u3);

plot(x,uf0);
hold on;
plot(x,uf1);
hold on;
plot(x,uf2);
hold on;
plot(x,uf3);
xlabel('x')
ylabel('u(x,t)')
