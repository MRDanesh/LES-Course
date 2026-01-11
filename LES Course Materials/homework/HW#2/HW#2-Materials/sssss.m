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
u1_3d=reshape(u1,ni,nj,nk);
% x coordinate direction = index i, first index
% y coordinate direction = index j, second index
% z coordinate direction = index k, third index

% compute average u by averaging in x (i) and z (k) directions
u1meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u1meanj(j)=u1meanj(j)+u1_3d(i,j,k)/ni/nk;
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


load u2.mat
load u3.mat
u2_3d=reshape(u2,ni,nj,nk);
u3_3d=reshape(u3,ni,nj,nk);
u2meanj(1:nj)=0;
u3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u2meanj(j)=u2meanj(j)+u2_3d(i,j,k)/ni/nk;
   u3meanj(j)=u3meanj(j)+u3_3d(i,j,k)/ni/nk;
end
end
end


load v1.mat
load v2.mat
load v3.mat
v1_3d=reshape(v1,ni,nj,nk);
v2_3d=reshape(v2,ni,nj,nk);
v3_3d=reshape(v3,ni,nj,nk);
v1meanj(1:nj)=0;
v2meanj(1:nj)=0;
v3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   v1meanj(j)=v1meanj(j)+v1_3d(i,j,k)/ni/nk; 
   v2meanj(j)=v2meanj(j)+v2_3d(i,j,k)/ni/nk;
   v3meanj(j)=v3meanj(j)+v3_3d(i,j,k)/ni/nk;
end
end
end


load w1.mat
load w2.mat
load w3.mat
w1_3d=reshape(w1,ni,nj,nk);
w2_3d=reshape(w2,ni,nj,nk);
w3_3d=reshape(w3,ni,nj,nk);
w1meanj(1:nj)=0;
w2meanj(1:nj)=0;
w3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   w1meanj(j)=w1meanj(j)+w1_3d(i,j,k)/ni/nk; 
   w2meanj(j)=w2meanj(j)+w2_3d(i,j,k)/ni/nk;
   w3meanj(j)=w3meanj(j)+w3_3d(i,j,k)/ni/nk;
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
u1_fluc(i,j,k)=u1_3d(i,j,k)-u1meanj(j);
u2_fluc(i,j,k)=u2_3d(i,j,k)-u2meanj(j);
u3_fluc(i,j,k)=u3_3d(i,j,k)-u3meanj(j);
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
v1_fluc(i,j,k)=v1_3d(i,j,k)-v1meanj(j);
v2_fluc(i,j,k)=v2_3d(i,j,k)-v2meanj(j);
v3_fluc(i,j,k)=v3_3d(i,j,k)-v3meanj(j);
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
w1_fluc(i,j,k)=w1_3d(i,j,k)-w1meanj(j);
w2_fluc(i,j,k)=w2_3d(i,j,k)-w2meanj(j);
w3_fluc(i,j,k)=w3_3d(i,j,k)-w3meanj(j);
end
end
end


for k=1:nk
for j=1:nj
for i=1:ni
u1_u1(i,j,k)=u1_fluc(i,j,k)*u1_fluc(i,j,k);
u2_u2(i,j,k)=u2_fluc(i,j,k)*u2_fluc(i,j,k);
u3_u3(i,j,k)=u3_fluc(i,j,k)*u3_fluc(i,j,k);
v1_v1(i,j,k)=v1_fluc(i,j,k)*v1_fluc(i,j,k);
v2_v2(i,j,k)=v2_fluc(i,j,k)*v2_fluc(i,j,k);
v3_v3(i,j,k)=v3_fluc(i,j,k)*v3_fluc(i,j,k);
w1_w1(i,j,k)=w1_fluc(i,j,k)*w1_fluc(i,j,k);
w2_w2(i,j,k)=w2_fluc(i,j,k)*w2_fluc(i,j,k);
w3_w3(i,j,k)=w3_fluc(i,j,k)*w3_fluc(i,j,k);
u1_v1(i,j,k)=u1_fluc(i,j,k)*v1_fluc(i,j,k);
u1_w1(i,j,k)=u1_fluc(i,j,k)*w1_fluc(i,j,k);
u2_v2(i,j,k)=u2_fluc(i,j,k)*v2_fluc(i,j,k);
u2_w2(i,j,k)=u2_fluc(i,j,k)*w2_fluc(i,j,k);
u3_v3(i,j,k)=u3_fluc(i,j,k)*v3_fluc(i,j,k);
u3_w3(i,j,k)=u3_fluc(i,j,k)*w3_fluc(i,j,k);
v1_w1(i,j,k)=v1_fluc(i,j,k)*w1_fluc(i,j,k);
v2_w2(i,j,k)=v2_fluc(i,j,k)*w2_fluc(i,j,k);
v3_w3(i,j,k)=v3_fluc(i,j,k)*w3_fluc(i,j,k);
end
end
end

% Finally we should take average in 3 directions: 

Reynolds_uu(1:nj)=0;
Reynolds_uv(1:nj)=0;
Reynolds_uw(1:nj)=0;
Reynolds_vv(1:nj)=0;
Reynolds_vw(1:nj)=0;
Reynolds_ww(1:nj)=0;




for k=1:nk
for i=1:ni
for j=1:nj
   Reynolds_uu(j)=Reynolds_uu(j)+(u1_u1(i,j,k)+u2_u2(i,j,k)+u3_u3(i,j,k))/ni/nk/3; 
   Reynolds_vv(j)=Reynolds_vv(j)+(v1_v1(i,j,k)+v2_v2(i,j,k)+v3_v3(i,j,k))/ni/nk/3; 
   Reynolds_ww(j)=Reynolds_ww(j)+(w1_w1(i,j,k)+w2_w2(i,j,k)+w3_w3(i,j,k))/ni/nk/3; 
   Reynolds_uv(j)=Reynolds_uv(j)+(u1_v1(i,j,k)+u2_v2(i,j,k)+u3_v3(i,j,k))/ni/nk/3;
   Reynolds_uw(j)=Reynolds_uw(j)+(u1_w1(i,j,k)+u2_w2(i,j,k)+u3_w3(i,j,k))/ni/nk/3; 
   Reynolds_vw(j)=Reynolds_vw(j)+(v1_w1(i,j,k)+v2_w2(i,j,k)+v3_w3(i,j,k))/ni/nk/3; 
end
end
end

K(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj
K(j)= K(j)+ 0.5* (u1_fluc(i,j,k)*u1_fluc(i,j,k)+v1_fluc(i,j,k)*v1_fluc(i,j,k)+w1_fluc(i,j,k)*w1_fluc(i,j,k)+u2_fluc(i,j,k)*u2_fluc(i,j,k)+v2_fluc(i,j,k)*v2_fluc(i,j,k)+w2_fluc(i,j,k)*w2_fluc(i,j,k)+u3_fluc(i,j,k)*u3_fluc(i,j,k)+v3_fluc(i,j,k)*v3_fluc(i,j,k)+w3_fluc(i,j,k)*w3_fluc(i,j,k))/ni/nk/3;
end
end
end

Re=500;

yplus(1:nj)=0;
for j=1:nj
yplus(j)=y(j)*Re;
end

plot(yplus,Reynolds_uu)
hold on;
plot(yplus,Reynolds_vv)
hold on;
plot(yplus,Reynolds_ww)
hold on;
plot(yplus,K)
hold on;

xlim([1 50]);
hold on;
legend('uu','vv','ww','K')
xlabel('y+')
ylabel('Reynolds stress components')




