close all
clear all

nu=1/500;
dx=6.542E-02;
dz=1.635E-02;
ni=96;
nj=49;
nk=96;

load u1.mat

load y.dat

load yc.dat


for j=1:nj-1
% dy = cell width
   dy(j)=yc(j+1)-yc(j);
end


%axis([0 1 0 22])
%xlabel('y','fontsize',[20])
%ylabel('U+','fontsize',[20])
handle=gca;
set(handle,'fontsize',[20])
print u.ps  -depsc


load u2.mat
load u3.mat
u1_3d=reshape(u1,ni,nj,nk);
u2_3d=reshape(u2,ni,nj,nk);
u3_3d=reshape(u3,ni,nj,nk);
u1meanj(1:nj)=0;
u2meanj(1:nj)=0;
u3meanj(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
    u1meanj(j)=u1meanj(j)+u1_3d(i,j,k)/ni/nk; 
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

umeanj(1:nj)=0;
for j=1:nj
    umeanj(j)= umeanj(j)+ (u1meanj(j)+u2meanj(j)+u3meanj(j))/3;
end

u_bulk(1:nj-1)=0;
for j=1:nj-1
   u_bulk(j)= ((umeanj(j+1)+umeanj(j))/2)*dy(j);
end
u_bulk_total=sum(u_bulk);
Ret=500;
Reynolds = u_bulk_total*Ret;




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

Re=500;

yplus(1:nj)=0;
for j=1:nj
yplus(j)=y(j)*Re;
end


K(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj
K(j)= K(j)+ 0.5* (u1_fluc(i,j,k)*u1_fluc(i,j,k)+v1_fluc(i,j,k)*v1_fluc(i,j,k)+w1_fluc(i,j,k)*w1_fluc(i,j,k)+u2_fluc(i,j,k)*u2_fluc(i,j,k)+v2_fluc(i,j,k)*v2_fluc(i,j,k)+w2_fluc(i,j,k)*w2_fluc(i,j,k)+u3_fluc(i,j,k)*u3_fluc(i,j,k)+v3_fluc(i,j,k)*v3_fluc(i,j,k)+w3_fluc(i,j,k)*w3_fluc(i,j,k))/ni/nk/3;
end
end
end









Reynolds_uu_k(1:nj)=0;
Reynolds_uv_k(1:nj)=0;
Reynolds_uw_k(1:nj)=0;
Reynolds_vv_k(1:nj)=0;
Reynolds_vw_k(1:nj)=0;
Reynolds_ww_k(1:nj)=0;




for j=1:nj
   Reynolds_uu_k(j)=Reynolds_uu_k(j)+Reynolds_uu(j)/K(j); 
   Reynolds_vv_k(j)=Reynolds_vv_k(j)+Reynolds_vv(j)/K(j);
   Reynolds_ww_k(j)=Reynolds_ww_k(j)+Reynolds_ww(j)/K(j);
   Reynolds_uv_k(j)=Reynolds_uv_k(j)+Reynolds_uv(j)/K(j);
   Reynolds_uw_k(j)=Reynolds_uw_k(j)+Reynolds_uw(j)/K(j);
   Reynolds_vw_k(j)=Reynolds_vw_k(j)+Reynolds_vw(j)/K(j); 
end



%%%%%%%%Part 1, Question 1%%%%%%%%

u1_filter_2n=f2(u1_3d,y,dx,dz,ni,nj,nk);

%a(1:nj)=0;
%b(1:nj)=0;
a=u1_3d(ni/2,1:nj,nk/2);
b=u1_filter_2n(ni/2,1:nj,nk/2);

plot(y,a);
hold on;
plot(y,b);
hold on;
