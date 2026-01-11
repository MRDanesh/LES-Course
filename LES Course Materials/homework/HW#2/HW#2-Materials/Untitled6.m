clc
close all
clear all

%% Initial Data
Re_taw=500;
nu=1/500;
dx=6.542E-02;
dz=1.635E-02;
ni=96;
nj=49;
nk=96;
n=1;%(ndx=delta/2)
%% Read Data & transform flow properties to a 3D array
% node coordinates
load y.dat
x=linspace(0,dx*(ni-1),ni)+dx/2;
z=linspace(0,dz*(nk-1),ni)+dz/2;

% face coordinates
xc=linspace(0,dx*(ni),ni+1);
zc=linspace(0,dz*(nk),ni+1);
load yc.dat

for j=1:nj-1
% dy = cell width
   dy(j)=yc(j+1)-yc(j);
end

load u1.mat
load u2.mat
load u3.mat

load v1.mat
load v2.mat
load v3.mat

load w1.mat
load w2.mat
load w3.mat

load p1.mat
load p2.mat
load p3.mat

u1_3d=reshape(u1,ni,nj,nk);
u2_3d=reshape(u2,ni,nj,nk);
u3_3d=reshape(u3,ni,nj,nk);

v1_3d=reshape(v1,ni,nj,nk);
v2_3d=reshape(v2,ni,nj,nk);
v3_3d=reshape(v3,ni,nj,nk);

w1_3d=reshape(w1,ni,nj,nk);
w2_3d=reshape(w2,ni,nj,nk);
w3_3d=reshape(w3,ni,nj,nk);

p1_3d=reshape(p1,ni,nj,nk);
p2_3d=reshape(p2,ni,nj,nk);
p3_3d=reshape(p3,ni,nj,nk);
u1_filter(1:96,1:48,1:96)=0;
u1_3d=u1_3d(:,2:end,:);
y=y(2:end);
for i=2:ni-1
for j=2:nj-2
for k=2:nk-1
u1_filter(i,j,k)= u1_filter(i,j,k)...
    ...
 +(u1_3d(i,j,k)*dx*dy(j)*dz + u1_3d(i,j,k-1)*dx*dy(j)*dz/2 + u1_3d(i,j,k+1)*dx*dy(j)*dz/2 ...
 + u1_3d(i+1,j,k)*(dx/2)*dy(j)*dz + u1_3d(i+1,j,k-1)*(dx/2)*dy(j)*dz/2 + u1_3d(i+1,j,k+1)*(dx/2)*dy(j)*dz/2 ...
 + u1_3d(i-1,j,k)*(dx/2)*dy(j)*dz + u1_3d(i-1,j,k-1)*(dx/2)*dy(j)*dz/2 + u1_3d(i-1,j,k+1)*(dx/2)*dy(j)*dz/2 ...
 + u1_3d(i,j+1,k)*(dx)*((dy(j)+y(j)-yc(j+1)))*dz + u1_3d(i,j+1,k-1)*(dx)*((dy(j)+y(j)-yc(j+1)))*dz/2 + u1_3d(i,j+1,k+1)*(dx)*((dy(j)+y(j)-yc(j+1)))*dz/2 ...
 + u1_3d(i-1,j+1,k)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz + u1_3d(i-1,j+1,k-1)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz/2 + u1_3d(i-1,j+1,k+1)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz/2 ...
 + u1_3d(i+1,j+1,k)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz + u1_3d(i+1,j+1,k-1)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz/2 + u1_3d(i+1,j+1,k+1)*(dx/2)*((dy(j)+y(j)-yc(j+1)))*dz/2 ...
 + u1_3d(i,j-1,k)*(dx)*(yc(j)-(y(j)-dy(j)))*dz + u1_3d(i,j-1,k-1)*(dx)*(yc(j)-(y(j)-dy(j)))*dz/2 + u1_3d(i,j-1,k+1)*(dx)*(yc(j)-(y(j)-dy(j)))*dz/2 ...
 + u1_3d(i-1,j-1,k)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz + u1_3d(i-1,j-1,k-1)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz/2 + u1_3d(i-1,j-1,k+1)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz/2 ...
 + u1_3d(i+1,j-1,k)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz + u1_3d(i+1,j-1,k-1)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz/2 + u1_3d(i+1,j-1,k+1)*(dx/2)*(yc(j)-(y(j)-dy(j)))*dz/2) ...
 /(8*dx*dz*dy(j)) ;                                                                                                                                          
end
end
end
