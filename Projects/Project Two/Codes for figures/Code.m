clear all; clc; close all;
%%
%%%Question 2 %%% LES Modeling for Second order discitization
load Smagsecond_512_U.out
load Wongsecond_512_U.out
load staticsecond_512_U.out
NDNS=8192;
Nx=512;
h_DNS = 2*pi/NDNS;
h_LES = 2*pi/Nx;
x_DNS=(0:h_DNS:2*pi-h_DNS);
x_LES=(0:h_LES:2*pi-h_LES);
u_Smag_second=Smagsecond_512_U(:,:);
u_Smag_second_200=u_Smag_second(2000,:);
u_Wong_second=Wongsecond_512_U(:,:);
u_Wong_second_200=u_Wong_second(2000,:);
u_static_second=staticsecond_512_U(:,:);
u_static_second_200=u_static_second(2000,:);
plot(x_LES,u_Smag_second_200);
hold on;
plot(x_LES,u_Wong_second_200);
hold on;
plot(x_LES,u_static_second_200);
hold on;
xlabel('x')
ylabel('Velocity')
legend({'$ Smagorinsky $','$ Wong $','$ Static(Cs^{2}=0.2 ) $'},'Interpreter', 'LaTeX','FontSize',12)
%%
%%%Question 3%%% 4rth order discritization and Range-Kutta
load Smag_512_U.out
load Wong_512_U.out
load Static_512_U.out
u_Smag=Smag_512_U(:,:);
u_Smag_200=Smag_512_U(2000,:);
u_Wong=Wong_512_U(:,:);
u_Wong_200=Wong_512_U(2000,:);
u_Static=Static_512_U(:,:);
u_Static_200=Static_512_U(2000,:);
plot(x_LES,u_Smag_200);
hold on;
plot(x_LES,u_Wong_200);
hold on;
plot(x_LES,u_Static_200);
hold on;
xlabel('x')
ylabel('Velocity')
legend({'$ Smagorinsky $','$ Wong $','$ Cs^{2}=0.2  $'},'Interpreter', 'LaTeX','FontSize',12)
%%
%%%Question 4%%% in the main code
%%
%%%Question 5%%% DNS in 4th order and 4th Range-Kutta
load DNS_8192_U.out
u_DNS=DNS_8192_U(:,:);
u_DNS_200=DNS_8192_U(2000,:);
plot(x_DNS,u_DNS_200);
hold on;
xlabel('x')
ylabel('Velocity')
legend({'$ DNS $'},'Interpreter', 'LaTeX','FontSize',12)
%%
%%%Question 6%%%  Comparision between DNS,filtered DNS, and LES models

for i=1:2000
for j=1:512
        u_DNS_filtered(i,j)=sum (u_DNS(i,(j-1)*16+1:j*16))/16;
end
end
u_DNS_filtered_200=u_DNS_filtered(2000,:);
plot(x_DNS,u_DNS_200);
hold on;
plot(x_LES,u_DNS_filtered_200);
hold on;
plot(x_LES,u_Smag_200);
hold on;
plot(x_LES,u_Wong_200);
hold on;
plot(x_LES,u_Static_200);
hold on;
xlabel('x')
ylabel('Velocity')
legend({'$ DNS  $','$ DNS filtered $','$ Smagorinsky $','$ Wong $','$ Cs^{2}=0.2 $'},'Interpreter', 'LaTeX','FontSize',12)
%%
%%%Question 7%%% Kinetic Energy for DNS and LES models

k_Smag(1:2000)=0;
for i=1:2000
    for j=1:512
        k_Smag(i)=k_Smag(i)+(u_Smag(i,j)*u_Smag(i,j))/(2*512);
    end
end

for j=1:200
        k_bar_Smag(j)=sum (k_Smag((j-1)*10+1:j*10))/10;
end


k_Wong(1:2000)=0;
for i=1:2000
    for j=1:512
        k_Wong(i)=k_Wong(i)+(u_Wong(i,j)*u_Wong(i,j))/(2*512);
    end
end

for j=1:200
        k_bar_Wong(j)=sum (k_Wong((j-1)*10+1:j*10))/10;
end

k_DNS_filtered(1:2000)=0;
for i=1:2000
    for j=1:512
        k_DNS_filtered(i)=k_DNS_filtered(i)+(u_DNS_filtered(i,j)*u_DNS_filtered(i,j))/(2*512);
    end
end

for j=1:200
        k_bar_DNS_filtered(j)=sum (k_DNS_filtered((j-1)*10+1:j*10))/10;
end

k_DNS(1:2000)=0;
for i=1:2000
    for j=1:8192
        k_DNS(i)=k_DNS(i)+(u_DNS(i,j)*u_DNS(i,j))/(2*8192);
    end
end

for j=1:200
        k_bar_DNS(j)=sum (k_DNS((j-1)*10+1:j*10))/10;
end

k_Static(1:2000)=0;
for i=1:2000
    for j=1:512
        k_Static(i)=k_Static(i)+(u_Static(i,j)*u_Static(i,j))/(2*512);
    end
end

for j=1:200
        k_bar_Static(j)=sum (k_Static((j-1)*10+1:j*10))/10;
end

t=(0.5:1:199.5);
semilogy(t,k_bar_DNS);
hold on;
semilogy(t,k_bar_DNS_filtered);
hold on;
semilogy(t,k_bar_Smag);
hold on;
semilogy(t,k_bar_Wong);
hold on;
semilogy(t,k_bar_Static);
hold on;
xlabel('time')
ylabel('KE')
legend({'$ DNS $','$ DNS filtered $','$ Smagorinsky $','$ Wong $','$ Static  Cs^{2}=0.2 $'},'Interpreter', 'LaTeX','FontSize',12)
%%
%%Question 8%%% Energy Spectrum

u_DNS_mean=zeros(2000,1);
for i=1:2000
    for j=1:8192
    u_DNS_mean(i,1)=u_DNS_mean(i,1)+u_DNS(i,j)/8192;
    end
end

for i=1:2000
    for j=1:8192
    u_DNS_fluc(i,j)=u_DNS(i,j)-u_DNS_mean(i,1);
    end
end

u_DNS_Fourier=(1/8192)*fft(u_DNS_fluc(1001:2000,:)');
u_DNS_Fourier=fftshift(u_DNS_Fourier);
K_E=(abs(u_DNS_Fourier).*abs(u_DNS_Fourier))';
K_E_bar_DNS(1,1:8192)=0;
for i=1:1000
    for j=1:8192
    K_E_bar_DNS(1,j)=K_E_bar_DNS(1,j)+K_E(i,j)/1000;
    end
end
%%%%

u_Smag_mean=zeros(2000,1);
for i=1:2000
    for j=1:512
    u_Smag_mean(i,1)=u_Smag_mean(i,1)+u_Smag(i,j)/512;
    end
end

for i=1:2000
    for j=1:512
    u_Smag_fluc(i,j)=u_Smag(i,j)-u_Smag_mean(i,1);
    end
end

u_Smag_Fourier=(1/512)*fft(u_Smag_fluc(1001:2000,:)');
u_Smag_Fourier=fftshift(u_Smag_Fourier);
K_E_Smag=(abs(u_Smag_Fourier).*abs(u_Smag_Fourier))';
K_E_bar_Smag(1,1:512)=0;
for i=1:1000
    for j=1:512
    K_E_bar_Smag(1,j)=K_E_bar_Smag(1,j)+K_E_Smag(i,j)/1000;
    end
end
%%%%

u_Wong_mean=zeros(2000,1);
for i=1:2000
    for j=1:512
    u_Wong_mean(i,1)=u_Wong_mean(i,1)+u_Wong(i,j)/512;
    end
end

for i=1:2000
    for j=1:512
    u_Wong_fluc(i,j)=u_Wong(i,j)-u_Wong_mean(i,1);
    end
end

u_Wong_Fourier=(1/512)*fft(u_Wong_fluc(1001:2000,:)');
u_Wong_Fourier=fftshift(u_Wong_Fourier);
K_E_Wong=(abs(u_Wong_Fourier).*abs(u_Wong_Fourier))';
K_E_bar_Wong(1,1:512)=0;
for i=1:1000
    for j=1:512
    K_E_bar_Wong(1,j)=K_E_bar_Wong(1,j)+K_E_Wong(i,j)/1000;
    end
end
%%%%%

u_Static_mean=zeros(2000,1);
for i=1:2000
    for j=1:512
    u_Static_mean(i,1)=u_Static_mean(i,1)+u_Static(i,j)/512;
    end
end

for i=1:2000
    for j=1:512
    u_Static_fluc(i,j)=u_Static(i,j)-u_Static_mean(i,1);
    end
end

u_Static_Fourier=(1/512)*fft(u_Static_fluc(1001:2000,:)');
u_Static_Fourier=fftshift(u_Static_Fourier);
K_E_Static=(abs(u_Static_Fourier).*abs(u_Static_Fourier))';
K_E_bar_Static(1,1:512)=0;
for i=1:1000
    for j=1:512
    K_E_bar_Static(1,j)=K_E_bar_Static(1,j)+K_E_Static(i,j)/1000;
    end
end
%%%

u_DNSfiltered_mean=zeros(2000,1);
for i=1:2000
    for j=1:512
    u_DNSfiltered_mean(i,1)=u_DNSfiltered_mean(i,1)+u_DNS_filtered(i,j)/512;
    end
end

for i=1:2000
    for j=1:512
    u_DNSfiltered_fluc(i,j)=u_DNS_filtered(i,j)-u_DNSfiltered_mean(i,1);
    end
end

u_DNSfiltered_Fourier=(1/512)*fft(u_DNSfiltered_fluc(1001:2000,:)');
u_DNSfiltered_Fourier=fftshift(u_DNSfiltered_Fourier);
K_E_filtered=(abs(u_DNSfiltered_Fourier).*abs(u_DNSfiltered_Fourier))';
K_E_bar_filtered(1,1:512)=0;
for i=1:1000
    for j=1:512
    K_E_bar_filtered(1,j)=K_E_bar_filtered(1,j)+K_E_filtered(i,j)/1000;
    end
end

k_DNS=0:8192/2-1;
k_LES=0:512/2-1;


loglog(k_DNS,K_E_bar_DNS(8192/2+1:8192));
hold on;
loglog(k_LES,K_E_bar_Smag(512/2+1:512));
hold on;
loglog(k_LES,K_E_bar_Wong(512/2+1:512));
hold on;
loglog(k_LES,K_E_bar_Static(512/2+1:512));
hold on;
loglog(k_LES,K_E_bar_filtered(512/2+1:512));
hold on;
xlabel('k')
ylabel('E(k)')
legend({'$ DNS $','$ Smagorinsky $','$ Wong $','$ Static  Cs^{2}=0.2 $','$ DNS Filtered $'},'Interpreter', 'LaTeX','FontSize',12)