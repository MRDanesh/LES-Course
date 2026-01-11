close all
clear all

nu=1/500;
dx=6.542E-02;
dz=1.635E-02;
ni=96;
nj=49;
nk=96;

% read u1 & transform u1 to a 3D array
load u1.mat
u1d=reshape(u1,ni,nj,nk);
% x coordinate direction = index i, first index
% y coordinate direction = index j, second index
% z coordinate direction = index k, third index

% compute average u by averaging in x (i) and z (k) directions
u1meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u1meanj(j)=u1meanj(j)+u1d(i,j,k)/ni/nk;
end
end
end

% node coordinates
load y.dat

% face coordinates
load yc.dat

for j=2:nj-1
% dy = cell width
   dy(j)=yc(j)-yc(j-1);
end

figure(1)
% plot u
plot(y,u1meanj)
axis([0 1 0 22])
xlabel('y','fontsize',[20])
ylabel('U+','fontsize',[20])
handle=gca;
set(handle,'fontsize',[20])
print u.ps  -depsc


Bulku1meanj(1:nj-1)=0;

for j=1:nj-1

 Bulku1meanj(j)= Bulku1meanj(j)+(u1meanj(j)+u1meanj(j+1))*dy(j)/2 ;

end
Bulku1meanj(nj)= (u1meanj(nj-1)+u1meanj(nj))*dy(nj-1)/2;
sum(Bulku1meanj)
h=1;
rho=998;
mu= 0.001;
Reynolds= Bulku1meanj*rho*h/mu

