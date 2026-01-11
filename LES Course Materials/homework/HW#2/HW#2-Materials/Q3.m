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


load u2.mat
load u3.mat
u2d=reshape(u2,ni,nj,nk);
u3d=reshape(u3,ni,nj,nk);
u2meanj(1:nj)=0;
u3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u2meanj(j)=u2meanj(j)+u2d(i,j,k)/ni/nk;
   u3meanj(j)=u3meanj(j)+u3d(i,j,k)/ni/nk;
end
end
end


load v1.mat
load v2.mat
load v3.mat
v1d=reshape(v1,ni,nj,nk);
v2d=reshape(v2,ni,nj,nk);
v3d=reshape(v3,ni,nj,nk);
v1meanj(1:nj)=0;
v2meanj(1:nj)=0;
v3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   v1meanj(j)=v1meanj(j)+v1d(i,j,k)/ni/nk; 
   v2meanj(j)=v2meanj(j)+v2d(i,j,k)/ni/nk;
   v3meanj(j)=v3meanj(j)+v3d(i,j,k)/ni/nk;
end
end
end


load w1.mat
load w2.mat
load w3.mat
w1d=reshape(w1,ni,nj,nk);
w2d=reshape(w2,ni,nj,nk);
w3d=reshape(w3,ni,nj,nk);
w1meanj(1:nj)=0;
w2meanj(1:nj)=0;
w3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   w1meanj(j)=w1meanj(j)+w1d(i,j,k)/ni/nk; 
   w2meanj(j)=w2meanj(j)+w2d(i,j,k)/ni/nk;
   w3meanj(j)=w3meanj(j)+w3d(i,j,k)/ni/nk;
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
u1_fluc(i,j,k)=u1d(i,j,k)-u1meanj(j);
u2_fluc(i,j,k)=u2d(i,j,k)-u2meanj(j);
u3_fluc(i,j,k)=u3d(i,j,k)-u3meanj(j);
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
v1_fluc(i,j,k)=v1d(i,j,k)-v1meanj(j);
v2_fluc(i,j,k)=v2d(i,j,k)-v2meanj(j);
v3_fluc(i,j,k)=v3d(i,j,k)-v3meanj(j);
end
end
end

for k=1:nk
for j=1:nj
for i=1:ni
w1_fluc(i,j,k)=w1d(i,j,k)-w1meanj(j);
w2_fluc(i,j,k)=w2d(i,j,k)-w2meanj(j);
w3_fluc(i,j,k)=w3d(i,j,k)-w3meanj(j);
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

Re=500;

yplus(1:nj)=0;
for j=1:nj
yplus(j)=y(j)*Re;
end


u1mean_grad(1:nj)=0;
u2mean_grad(1:nj)=0;
u3mean_grad(1:nj)=0;
for j=1:nj-1
    u1mean_grad(j)=(u1meanj(j+1)-u1meanj(j))/dy(j);
    u2mean_grad(j)=(u2meanj(j+1)-u2meanj(j))/dy(j);
    u3mean_grad(j)=(u3meanj(j+1)-u3meanj(j))/dy(j);
end

u1mean_grad(nj)=u1mean_grad(nj-1);
u2mean_grad(nj)=u2mean_grad(nj-1);
u3mean_grad(nj)=u3mean_grad(nj-1);

umean_grad(1:nj)=0;
for j=1:nj
    umean_grad(j)= (u1mean_grad(j)+u2mean_grad(j)+u3mean_grad(j))/3;
end

Production(1:nj)=0;
for j=1:nj
    Production(j)= -Reynolds_uv(j)*umean_grad(j) ;
end

%plot(yplus,Production);
xlabel('y+')
ylabel('Production')




% for calculating disipation we should first calculate the <s:s> 

u1_grad_x(1:ni,1:nj,1:nk)=0;
u2_grad_x(1:ni,1:nj,1:nk)=0;
u3_grad_x(1:ni,1:nj,1:nk)=0;
u1_grad_y(1:ni,1:nj,1:nk)=0;
u2_grad_y(1:ni,1:nj,1:nk)=0;
u3_grad_y(1:ni,1:nj,1:nk)=0;
u1_grad_z(1:ni,1:nj,1:nk)=0;
u2_grad_z(1:ni,1:nj,1:nk)=0;
u3_grad_z(1:ni,1:nj,1:nk)=0;
v1_grad_x(1:ni,1:nj,1:nk)=0;
v2_grad_x(1:ni,1:nj,1:nk)=0;
v3_grad_x(1:ni,1:nj,1:nk)=0;
v1_grad_y(1:ni,1:nj,1:nk)=0;
v2_grad_y(1:ni,1:nj,1:nk)=0;
v3_grad_y(1:ni,1:nj,1:nk)=0;
v1_grad_z(1:ni,1:nj,1:nk)=0;
v2_grad_z(1:ni,1:nj,1:nk)=0;
v3_grad_z(1:ni,1:nj,1:nk)=0;
w1_grad_x(1:ni,1:nj,1:nk)=0;
w2_grad_x(1:ni,1:nj,1:nk)=0;
w3_grad_x(1:ni,1:nj,1:nk)=0;
w1_grad_y(1:ni,1:nj,1:nk)=0;
w2_grad_y(1:ni,1:nj,1:nk)=0;
w3_grad_y(1:ni,1:nj,1:nk)=0;
w1_grad_z(1:ni,1:nj,1:nk)=0;
w2_grad_z(1:ni,1:nj,1:nk)=0;
w3_grad_z(1:ni,1:nj,1:nk)=0;

% first calculate gradient in x direction for all velocity components

for i=1:ni-1
for j=1:nj
for k=1:nk
    u1_grad_x(i,j,k)= (u1_fluc(i+1,j,k)-u1_fluc(i,j,k))/dx;
    u2_grad_x(i,j,k)= (u2_fluc(i+1,j,k)-u2_fluc(i,j,k))/dx;
    u3_grad_x(i,j,k)= (u3_fluc(i+1,j,k)-u3_fluc(i,j,k))/dx;
    v1_grad_x(i,j,k)= (v1_fluc(i+1,j,k)-v1_fluc(i,j,k))/dx;
    v2_grad_x(i,j,k)= (v2_fluc(i+1,j,k)-v2_fluc(i,j,k))/dx;
    v3_grad_x(i,j,k)= (v3_fluc(i+1,j,k)-v3_fluc(i,j,k))/dx;
    w1_grad_x(i,j,k)= (w1_fluc(i+1,j,k)-w1_fluc(i,j,k))/dx;
    w2_grad_x(i,j,k)= (w2_fluc(i+1,j,k)-w2_fluc(i,j,k))/dx;
    w3_grad_x(i,j,k)= (w3_fluc(i+1,j,k)-w3_fluc(i,j,k))/dx;
end
end
end

for j=1:nj
for k=1:nk
    u1_grad_x(ni,j,k)= u1_grad_x(ni-1,j,k);
    u2_grad_x(ni,j,k)= u2_grad_x(ni-1,j,k);
    u3_grad_x(ni,j,k)= u3_grad_x(ni-1,j,k);
    v1_grad_x(ni,j,k)= v1_grad_x(ni-1,j,k);
    v2_grad_x(ni,j,k)= v2_grad_x(ni-1,j,k);
    v3_grad_x(ni,j,k)= v3_grad_x(ni-1,j,k);
    w1_grad_x(ni,j,k)= w1_grad_x(ni-1,j,k);
    w2_grad_x(ni,j,k)= w2_grad_x(ni-1,j,k);
    w3_grad_x(ni,j,k)= w3_grad_x(ni-1,j,k);
end
end



% similary we calculate gradient in y direction:

for i=1:ni
for j=1:nj-2
for k=1:nk
    u1_grad_y(i,j,k)= (u1_fluc(i,j+1,k)-u1_fluc(i,j,k))/dy(j+1);
    u2_grad_y(i,j,k)= (u2_fluc(i,j+1,k)-u2_fluc(i,j,k))/dy(j+1);
    u3_grad_y(i,j,k)= (u3_fluc(i,j+1,k)-u3_fluc(i,j,k))/dy(j+1);
    v1_grad_y(i,j,k)= (v1_fluc(i,j+1,k)-v1_fluc(i,j,k))/dy(j+1);
    v2_grad_y(i,j,k)= (v2_fluc(i,j+1,k)-v2_fluc(i,j,k))/dy(j+1);
    v3_grad_y(i,j,k)= (v3_fluc(i,j+1,k)-v3_fluc(i,j,k))/dy(j+1);
    w1_grad_y(i,j,k)= (w1_fluc(i,j+1,k)-w1_fluc(i,j,k))/dy(j+1);
    w2_grad_y(i,j,k)= (w2_fluc(i,j+1,k)-w2_fluc(i,j,k))/dy(j+1);
    w3_grad_y(i,j,k)= (w3_fluc(i,j+1,k)-w3_fluc(i,j,k))/dy(j+1);
end
end
end
    
for i=1:ni
for j=nj-2:nj    
for k=1:nk
    u1_grad_y(i,j,k)= u1_grad_y(i,j-1,k);
    u2_grad_y(i,j,k)= u2_grad_y(i,j-1,k);
    u3_grad_y(i,j,k)= u3_grad_y(i,j-1,k);
    v1_grad_y(i,j,k)= v1_grad_y(i,j-1,k);
    v2_grad_y(i,j,k)= v2_grad_y(i,j-1,k);
    v3_grad_y(i,j,k)= v3_grad_y(i,j-1,k);
    w1_grad_y(i,j,k)= w1_grad_y(i,j-1,k);
    w2_grad_y(i,j,k)= w2_grad_y(i,j-1,k);
    w3_grad_y(i,j,k)= w3_grad_y(i,j-1,k);
end
end 
end



% Finallay in z direction
    
 for i=1:ni
for j=1:nj
for k=1:nk-1
    u1_grad_z(i,j,k)= (u1_fluc(i,j,k+1)-u1_fluc(i,j,k))/dz;
    u2_grad_z(i,j,k)= (u2_fluc(i,j,k+1)-u2_fluc(i,j,k))/dz;
    u3_grad_z(i,j,k)= (u3_fluc(i,j,k+1)-u3_fluc(i,j,k))/dz;
    v1_grad_z(i,j,k)= (v1_fluc(i,j,k+1)-v1_fluc(i,j,k))/dz;
    v2_grad_z(i,j,k)= (v2_fluc(i,j,k+1)-v2_fluc(i,j,k))/dz;
    v3_grad_z(i,j,k)= (v3_fluc(i,j,k+1)-v3_fluc(i,j,k))/dz;
    w1_grad_z(i,j,k)= (w1_fluc(i,j,k+1)-w1_fluc(i,j,k))/dz;
    w2_grad_z(i,j,k)= (w2_fluc(i,j,k+1)-w2_fluc(i,j,k))/dz;
    w3_grad_z(i,j,k)= (w3_fluc(i,j,k+1)-w3_fluc(i,j,k))/dz;
end
end
end  
    
for i=1:ni
for j=1:nj
    u1_grad_z(i,j,nk)= u1_grad_z(i,j,nk-1);
    u2_grad_z(i,j,nk)= u2_grad_z(i,j,nk-1);
    u3_grad_z(i,j,nk)= u3_grad_z(i,j,nk-1);
    v1_grad_z(i,j,nk)= v1_grad_z(i,j,nk-1);
    v2_grad_z(i,j,nk)= v2_grad_z(i,j,nk-1);
    v3_grad_z(i,j,nk)= v3_grad_z(i,j,nk-1);
    w1_grad_z(i,j,nk)= w1_grad_z(i,j,nk-1);
    w2_grad_z(i,j,nk)= w2_grad_z(i,j,nk-1);
    w3_grad_z(i,j,nk)= w3_grad_z(i,j,nk-1);
end
end     



% now we can calculate <s:s> :

u_uT_1 (1:ni,1:nj,1:nk)=0;
u_uT_2 (1:ni,1:nj,1:nk)=0;
u_uT_3 (1:ni,1:nj,1:nk)=0;
u_u_1(1:ni,1:nj,1:nk)=0;
u_u_2(1:ni,1:nj,1:nk)=0;
u_u_3(1:ni,1:nj,1:nk)=0;
for i=1:ni
for j=1:nj
for k=1:nk
u_uT_1(i,j,k) = u_uT_1(i,j,k)+(u1_grad_x(i,j,k) * u1_grad_x(i,j,k) + u1_grad_y(i,j,k) * v1_grad_x(i,j,k) + u1_grad_z(i,j,k) * w1_grad_x(i,j,k) + v1_grad_x(i,j,k) * u1_grad_y(i,j,k) + v1_grad_y(i,j,k) * v1_grad_y(i,j,k) + v1_grad_z(i,j,k) * w1_grad_y(i,j,k) + w1_grad_x(i,j,k) * u1_grad_z(i,j,k) + w1_grad_y(i,j,k) * v1_grad_z(i,j,k) + w1_grad_z(i,j,k) * w1_grad_z(i,j,k));
u_uT_2(i,j,k) = u_uT_3(i,j,k)+(u2_grad_x(i,j,k) * u2_grad_x(i,j,k) + u2_grad_y(i,j,k) * v2_grad_x(i,j,k) + u2_grad_z(i,j,k) * w2_grad_x(i,j,k) + v2_grad_x(i,j,k) * u2_grad_y(i,j,k) + v2_grad_y(i,j,k) * v2_grad_y(i,j,k) + v2_grad_z(i,j,k) * w2_grad_y(i,j,k) + w2_grad_x(i,j,k) * u2_grad_z(i,j,k) + w2_grad_y(i,j,k) * v2_grad_z(i,j,k) + w2_grad_z(i,j,k) * w2_grad_z(i,j,k));
u_uT_3(i,j,k) = u_uT_3(i,j,k)+(u3_grad_x(i,j,k) * u3_grad_x(i,j,k) + u3_grad_y(i,j,k) * v3_grad_x(i,j,k) + u3_grad_z(i,j,k) * w3_grad_x(i,j,k) + v3_grad_x(i,j,k) * u3_grad_y(i,j,k) + v3_grad_y(i,j,k) * v3_grad_y(i,j,k) + v3_grad_z(i,j,k) * w3_grad_y(i,j,k) + w3_grad_x(i,j,k) * u3_grad_z(i,j,k) + w3_grad_y(i,j,k) * v3_grad_z(i,j,k) + w3_grad_z(i,j,k) * w3_grad_z(i,j,k));
u_u_1(i,j,k)= u_u_1(i,j,k)+ (u1_grad_x(i,j,k) * u1_grad_x(i,j,k) + u1_grad_y(i,j,k) * u1_grad_y(i,j,k) + u1_grad_z(i,j,k) * u1_grad_z(i,j,k) + v1_grad_x(i,j,k) * v1_grad_x(i,j,k) + v1_grad_y(i,j,k) * v1_grad_y(i,j,k) + v1_grad_z(i,j,k) * v1_grad_z(i,j,k) + w1_grad_x(i,j,k) * w1_grad_z(i,j,k) + w1_grad_y(i,j,k) * w1_grad_y(i,j,k) + w1_grad_z(i,j,k) * w1_grad_z(i,j,k));
u_u_2(i,j,k)= u_u_2(i,j,k)+ (u2_grad_x(i,j,k) * u2_grad_x(i,j,k) + u2_grad_y(i,j,k) * u2_grad_y(i,j,k) + u2_grad_z(i,j,k) * u2_grad_z(i,j,k) + v2_grad_x(i,j,k) * v2_grad_x(i,j,k) + v2_grad_y(i,j,k) * v2_grad_y(i,j,k) + v2_grad_z(i,j,k) * v2_grad_z(i,j,k) + w2_grad_x(i,j,k) * w2_grad_z(i,j,k) + w2_grad_y(i,j,k) * w2_grad_y(i,j,k) + w2_grad_z(i,j,k) * w2_grad_z(i,j,k));
u_u_3(i,j,k)= u_u_3(i,j,k)+ (u3_grad_x(i,j,k) * u3_grad_x(i,j,k) + u3_grad_y(i,j,k) * u3_grad_y(i,j,k) + u3_grad_z(i,j,k) * u3_grad_z(i,j,k) + v3_grad_x(i,j,k) * v3_grad_x(i,j,k) + v3_grad_y(i,j,k) * v3_grad_y(i,j,k) + v3_grad_z(i,j,k) * v3_grad_z(i,j,k) + w3_grad_x(i,j,k) * w3_grad_z(i,j,k) + w3_grad_y(i,j,k) * w3_grad_y(i,j,k) + w3_grad_z(i,j,k) * w3_grad_z(i,j,k));
end
end
end

s_s_mean (1:nj)=0;

for i=1:ni
for j=1:nj
for k=1:nk
s_s_mean(j) = s_s_mean(j)+ (u_uT_1(i,j,k)+u_uT_2(i,j,k)+u_uT_3(i,j,k)+u_u_1(i,j,k)+u_u_2(i,j,k)+u_u_3(i,j,k))/ni/nk/3;
end
end
end

disipation_rate(1:nj)=0;

for j=1:nj
   
   disipation_rate (j)= disipation_rate(j)+ nu*s_s_mean(j);
   
end

plot(yplus,disipation_rate);
xlabel('y+')
ylabel('Rate of dissipation')
















































