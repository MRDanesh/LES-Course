close all
clear all

nu=1/500;
dx=6.542E-02;
dz=1.635E-02;
ni=96;
nj=49;
nk=96;


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
u1d=reshape(u1,ni,nj,nk);
u2d=reshape(u2,ni,nj,nk);
u3d=reshape(u3,ni,nj,nk);
v1d=reshape(v1,ni,nj,nk);
v2d=reshape(v2,ni,nj,nk);
v3d=reshape(v3,ni,nj,nk);
w1d=reshape(w1,ni,nj,nk);
w2d=reshape(w2,ni,nj,nk);
w3d=reshape(w3,ni,nj,nk);
p1d=reshape(p1,ni,nj,nk);
p2d=reshape(p2,ni,nj,nk);
p3d=reshape(p3,ni,nj,nk);

% x coordinate direction = index i, first index
% y coordinate direction = index j, second index
% z coordinate direction = index k, third index

% compute average u by averaging in x (i) and z (k) directions
u1mean(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u1mean(j)=u1mean(j)+u1d(i,j,k)/ni/nk;
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

u1bulk=trapz(y,u1mean);
h=1;
Re=u1bulk*h/nu;

%figure(1)
% plot u1
%plot(y,u1mean)
%axis([0 1 0 22])
%xlabel('y','fontsize',[20])
%ylabel('U+','fontsize',[20])
%handle=gca;
%set(handle,'fontsize',[20])
%print u.ps  -depsc





%reynold stress
u1mean(1:nj)=0;
u2mean(1:nj)=0;
u3mean(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   u1mean(j)=u1mean(j)+u1d(i,j,k)/ni/nk;
   u2mean(j)=u2mean(j)+u2d(i,j,k)/ni/nk;
   u3mean(j)=u3mean(j)+u3d(i,j,k)/ni/nk;
end
end
end


v1mean(1:nj)=0;
v2mean(1:nj)=0;
v3mean(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   v1mean(j)=v1mean(j)+v1d(i,j,k)/ni/nk;
   v2mean(j)=v2mean(j)+v2d(i,j,k)/ni/nk;
   v3mean(j)=v3mean(j)+v3d(i,j,k)/ni/nk;
end
end
end

w1mean(1:nj)=0;
w2mean(1:nj)=0;
w3mean(1:nj)=0;
for k=1:nk
for j=1:nj
for i=1:ni
   w1mean(j)=w1mean(j)+w1d(i,j,k)/ni/nk;
   w2mean(j)=w2mean(j)+w2d(i,j,k)/ni/nk;
   w3mean(j)=w3mean(j)+w3d(i,j,k)/ni/nk;
end
end
end

uu=zeros(nj,1);
uv=zeros(nj,1);
uw=zeros(nj,1);
vv=zeros(nj,1);
vw=zeros(nj,1);
ww=zeros(nj,1);
for k=1:nk
for j=1:nj
for i=1:ni
u1fluct=u1d(i,j,k)-u1mean(j);
v1fluct=v1d(i,j,k)-v1mean(j);
w1fluct=w1d(i,j,k)-w1mean(j);
u2fluct=u2d(i,j,k)-u2mean(j);
v2fluct=v2d(i,j,k)-v2mean(j);
w2fluct=w2d(i,j,k)-w2mean(j);
u3fluct=u3d(i,j,k)-u3mean(j);
v3fluct=v3d(i,j,k)-v3mean(j);
w3fluct=w3d(i,j,k)-w3mean(j);

uu(j)=uu(j)+(u1fluct*u1fluct+u2fluct*u2fluct+u3fluct*u3fluct)/ni/nk/3;
uv(j)=uv(j)+(u1fluct*v1fluct+u2fluct*v2fluct+u3fluct*v3fluct)/ni/nk/3;
uw(j)=uw(j)+(u1fluct*w1fluct+u2fluct*w2fluct+u3fluct*w3fluct)/ni/nk/3;
vv(j)=vv(j)+(v1fluct*v1fluct+v2fluct*v2fluct+v3fluct*v3fluct)/ni/nk/3;
vw(j)=vw(j)+(v1fluct*w1fluct+v2fluct*w2fluct+v3fluct*w3fluct)/ni/nk/3;
ww(j)=ww(j)+(w1fluct*w1fluct+w2fluct*w2fluct+w3fluct*w3fluct)/ni/nk/3;


end
end
end

for j=1:nj
    y_plus(j)=y(j)*1/nu;
end

%figure(2)
% plot 
%plot(y_plus,uu)
%axis([0 500 -1 8])
%xlabel('y+','fontsize',[20])
%ylabel('<uiuj>/ut^2','fontsize',[20])
%handle=gca;
%set(handle,'fontsize',[20])
%hold on
%plot(y_plus,vv)
%hold on
%plot(y_plus,ww)
%hold on
%plot(y_plus,uv)
%hold on
%plot(y_plus,uw)
%hold on
%plot(y_plus,vw)



for k=1:nk
for j=1:nj
for i=1:ni
u1fluct(i,j,k)=u1d(i,j,k)-u1mean(j);
v1fluct(i,j,k)=v1d(i,j,k)-v1mean(j);
w1fluct(i,j,k)=w1d(i,j,k)-w1mean(j);
u2fluct(i,j,k)=u2d(i,j,k)-u2mean(j);
v2fluct(i,j,k)=v2d(i,j,k)-v2mean(j);
w2fluct(i,j,k)=w2d(i,j,k)-w2mean(j);
u3fluct(i,j,k)=u3d(i,j,k)-u3mean(j);
v3fluct(i,j,k)=v3d(i,j,k)-v3mean(j);
w3fluct(i,j,k)=w3d(i,j,k)-w3mean(j);
end
end
end

for k=2:nk-1
for j=1:nj
for i=2:ni-1
    
    if j==1
u1_x1(i,j,k)=(u1fluct(i+1,j,k)-u1fluct(i-1,j,k))/2/dx;
u1_x2(i,j,k)=(u1fluct(i,j+1,k)-u1fluct(i,j,k))/(y(j+1)-y(j));
u1_x3(i,j,k)=(u1fluct(i,j,k+1)-u1fluct(i,j,k-1))/2/dz;
v1_x1(i,j,k)=(v1fluct(i+1,j,k)-v1fluct(i-1,j,k))/2/dx;
v1_x2(i,j,k)=(v1fluct(i,j+1,k)-v1fluct(i,j,k))/(y(j+1)-y(j));
v1_x3(i,j,k)=(v1fluct(i,j,k+1)-v1fluct(i,j,k-1))/2/dz;
w1_x1(i,j,k)=(w1fluct(i+1,j,k)-w1fluct(i-1,j,k))/2/dx;
w1_x2(i,j,k)=(w1fluct(i,j+1,k)-w1fluct(i,j,k))/(y(j+1)-y(j));
w1_x3(i,j,k)=(w1fluct(i,j,k+1)-w1fluct(i,j,k-1))/2/dz;  

u2_x1(i,j,k)=(u2fluct(i+1,j,k)-u2fluct(i-1,j,k))/2/dx;
u2_x2(i,j,k)=(u2fluct(i,j+1,k)-u2fluct(i,j,k))/(y(j+1)-y(j));
u2_x3(i,j,k)=(u2fluct(i,j,k+1)-u2fluct(i,j,k-1))/2/dz;
v2_x1(i,j,k)=(v2fluct(i+1,j,k)-v2fluct(i-1,j,k))/2/dx;
v2_x2(i,j,k)=(v2fluct(i,j+1,k)-v2fluct(i,j,k))/(y(j+1)-y(j));
v2_x3(i,j,k)=(v2fluct(i,j,k+1)-v2fluct(i,j,k-1))/2/dz;
w2_x1(i,j,k)=(w2fluct(i+1,j,k)-w2fluct(i-1,j,k))/2/dx;
w2_x2(i,j,k)=(w2fluct(i,j+1,k)-w2fluct(i,j,k))/(y(j+1)-y(j));
w2_x3(i,j,k)=(w2fluct(i,j,k+1)-w2fluct(i,j,k-1))/2/dz; 

u3_x1(i,j,k)=(u3fluct(i+1,j,k)-u3fluct(i-1,j,k))/2/dx;
u3_x2(i,j,k)=(u3fluct(i,j+1,k)-u3fluct(i,j,k))/(y(j+1)-y(j));
u3_x3(i,j,k)=(u3fluct(i,j,k+1)-u3fluct(i,j,k-1))/2/dz;
v3_x1(i,j,k)=(v3fluct(i+1,j,k)-v3fluct(i-1,j,k))/2/dx;
v3_x2(i,j,k)=(v3fluct(i,j+1,k)-v3fluct(i,j,k))/(y(j+1)-y(j));
v3_x3(i,j,k)=(v3fluct(i,j,k+1)-v3fluct(i,j,k-1))/2/dz;
w3_x1(i,j,k)=(w3fluct(i+1,j,k)-w3fluct(i-1,j,k))/2/dx;
w3_x2(i,j,k)=(w3fluct(i,j+1,k)-w3fluct(i,j,k))/(y(j+1)-y(j));
w3_x3(i,j,k)=(w3fluct(i,j,k+1)-w3fluct(i,j,k-1))/2/dz; 
    elseif j==nj
u1_x1(i,j,k)=(u1fluct(i+1,j,k)-u1fluct(i-1,j,k))/2/dx;
u1_x2(i,j,k)=0;
u1_x3(i,j,k)=(u1fluct(i,j,k+1)-u1fluct(i,j,k-1))/2/dz;
v1_x1(i,j,k)=(v1fluct(i+1,j,k)-v1fluct(i-1,j,k))/2/dx;
v1_x2(i,j,k)=0;
v1_x3(i,j,k)=(v1fluct(i,j,k+1)-v1fluct(i,j,k-1))/2/dz;
w1_x1(i,j,k)=(w1fluct(i+1,j,k)-w1fluct(i-1,j,k))/2/dx;
w1_x2(i,j,k)=0;
w1_x3(i,j,k)=(w1fluct(i,j,k+1)-w1fluct(i,j,k-1))/2/dz; 

u2_x1(i,j,k)=(u2fluct(i+1,j,k)-u2fluct(i-1,j,k))/2/dx;
u2_x2(i,j,k)=0;
u2_x3(i,j,k)=(u2fluct(i,j,k+1)-u2fluct(i,j,k-1))/2/dz;
v2_x1(i,j,k)=(v2fluct(i+1,j,k)-v2fluct(i-1,j,k))/2/dx;
v2_x2(i,j,k)=0;
v2_x3(i,j,k)=(v2fluct(i,j,k+1)-v2fluct(i,j,k-1))/2/dz;
w2_x1(i,j,k)=(w2fluct(i+1,j,k)-w2fluct(i-1,j,k))/2/dx;
w2_x2(i,j,k)=0;
w2_x3(i,j,k)=(w2fluct(i,j,k+1)-w2fluct(i,j,k-1))/2/dz; 

u3_x1(i,j,k)=(u3fluct(i+1,j,k)-u3fluct(i-1,j,k))/2/dx;
u3_x2(i,j,k)=0;
u3_x3(i,j,k)=(u3fluct(i,j,k+1)-u3fluct(i,j,k-1))/2/dz;
v3_x1(i,j,k)=(v3fluct(i+1,j,k)-v3fluct(i-1,j,k))/2/dx;
v3_x2(i,j,k)=0;
v3_x3(i,j,k)=(v3fluct(i,j,k+1)-v3fluct(i,j,k-1))/2/dz;
w3_x1(i,j,k)=(w3fluct(i+1,j,k)-w3fluct(i-1,j,k))/2/dx;
w3_x2(i,j,k)=0;
w3_x3(i,j,k)=(w3fluct(i,j,k+1)-w3fluct(i,j,k-1))/2/dz; 


    else    
u1_x1(i,j,k)=(u1fluct(i+1,j,k)-u1fluct(i-1,j,k))/2/dx;
u1_x2(i,j,k)=(u1fluct(i,j-1,k)-u1fluct(i,j+1,k))/(y(j+1)-y(j-1));
u1_x3(i,j,k)=(u1fluct(i,j,k+1)-u1fluct(i,j,k-1))/2/dz;
v1_x1(i,j,k)=(v1fluct(i+1,j,k)-v1fluct(i-1,j,k))/2/dx;
v1_x2(i,j,k)=(v1fluct(i,j-1,k)-v1fluct(i,j+1,k))/(y(j+1)-y(j-1));
v1_x3(i,j,k)=(v1fluct(i,j,k+1)-v1fluct(i,j,k-1))/2/dz;
w1_x1(i,j,k)=(w1fluct(i+1,j,k)-w1fluct(i-1,j,k))/2/dx;
w1_x2(i,j,k)=(w1fluct(i,j-1,k)-w1fluct(i,j+1,k))/(y(j+1)-y(j-1));
w1_x3(i,j,k)=(w1fluct(i,j,k+1)-w1fluct(i,j,k-1))/2/dz;

u2_x1(i,j,k)=(u2fluct(i+1,j,k)-u2fluct(i-1,j,k))/2/dx;
u2_x2(i,j,k)=(u2fluct(i,j-1,k)-u2fluct(i,j+1,k))/(y(j+1)-y(j-1));
u2_x3(i,j,k)=(u2fluct(i,j,k+1)-u2fluct(i,j,k-1))/2/dz;
v2_x1(i,j,k)=(v2fluct(i+1,j,k)-v2fluct(i-1,j,k))/2/dx;
v2_x2(i,j,k)=(v2fluct(i,j-1,k)-v2fluct(i,j+1,k))/(y(j+1)-y(j-1));
v2_x3(i,j,k)=(v2fluct(i,j,k+1)-v2fluct(i,j,k-1))/2/dz;
w2_x1(i,j,k)=(w2fluct(i+1,j,k)-w2fluct(i-1,j,k))/2/dx;
w2_x2(i,j,k)=(w2fluct(i,j-1,k)-w2fluct(i,j+1,k))/(y(j+1)-y(j-1));
w2_x3(i,j,k)=(w2fluct(i,j,k+1)-w2fluct(i,j,k-1))/2/dz;

u3_x1(i,j,k)=(u3fluct(i+1,j,k)-u3fluct(i-1,j,k))/2/dx;
u3_x2(i,j,k)=(u3fluct(i,j-1,k)-u3fluct(i,j+1,k))/(y(j+1)-y(j-1));
u3_x3(i,j,k)=(u3fluct(i,j,k+1)-u3fluct(i,j,k-1))/2/dz;
v3_x1(i,j,k)=(v3fluct(i+1,j,k)-v3fluct(i-1,j,k))/2/dx;
v3_x2(i,j,k)=(v3fluct(i,j-1,k)-v3fluct(i,j+1,k))/(y(j+1)-y(j-1));
v3_x3(i,j,k)=(v3fluct(i,j,k+1)-v3fluct(i,j,k-1))/2/dz;
w3_x1(i,j,k)=(w3fluct(i+1,j,k)-w3fluct(i-1,j,k))/2/dx;
w3_x2(i,j,k)=(w3fluct(i,j-1,k)-w3fluct(i,j+1,k))/(y(j+1)-y(j-1));
w3_x3(i,j,k)=(w3fluct(i,j,k+1)-w3fluct(i,j,k-1))/2/dz;
    end
end
end
end


u_x1_u_x1(1:nj)=0;
u_x2_u_x2(1:nj)=0;
u_x3_u_x3(1:nj)=0;
v_x1_v_x1(1:nj)=0;
v_x2_v_x2(1:nj)=0;
v_x3_v_x3(1:nj)=0;
w_x1_w_x1(1:nj)=0;
w_x2_w_x2(1:nj)=0;
w_x3_w_x3(1:nj)=0;
u_x2_v_x1(1:nj)=0;
u_x3_w_x1(1:nj)=0;
v_x3_w_x2(1:nj)=0;
for k=2:nk-1
for j=1:nj
for i=2:ni-1
   u_x1_u_x1(j)=u_x1_u_x1(j)+((u1_x1(i,j,k)*u1_x1(i,j,k))+(u2_x1(i,j,k)*u2_x1(i,j,k))+(u3_x1(i,j,k)*u3_x1(i,j,k)))/(nk-2)/(ni-2)/3;
   u_x2_u_x2(j)=u_x2_u_x2(j)+((u1_x2(i,j,k)*u1_x2(i,j,k))+(u2_x2(i,j,k)*u2_x2(i,j,k))+(u3_x2(i,j,k)*u3_x2(i,j,k)))/(nk-2)/(ni-2)/3;
   u_x3_u_x3(j)=u_x3_u_x3(j)+((u1_x3(i,j,k)*u1_x3(i,j,k))+(u2_x3(i,j,k)*u2_x3(i,j,k))+(u3_x3(i,j,k)*u3_x3(i,j,k)))/(nk-2)/(ni-2)/3;
   v_x1_v_x1(j)=v_x1_v_x1(j)+((v1_x1(i,j,k)*v1_x1(i,j,k))+(v2_x1(i,j,k)*v2_x1(i,j,k))+(v3_x1(i,j,k)*v3_x1(i,j,k)))/(nk-2)/(ni-2)/3;
   v_x2_v_x2(j)=v_x2_v_x2(j)+((v1_x2(i,j,k)*v1_x2(i,j,k))+(v2_x2(i,j,k)*v2_x2(i,j,k))+(v3_x2(i,j,k)*v3_x2(i,j,k)))/(nk-2)/(ni-2)/3;
   v_x3_v_x3(j)=v_x3_v_x3(j)+((v1_x3(i,j,k)*v1_x3(i,j,k))+(v2_x3(i,j,k)*v2_x3(i,j,k))+(v3_x3(i,j,k)*v3_x3(i,j,k)))/(nk-2)/(ni-2)/3;
   w_x1_w_x1(j)=w_x1_w_x1(j)+((w1_x1(i,j,k)*w1_x1(i,j,k))+(w2_x1(i,j,k)*w2_x1(i,j,k))+(w3_x1(i,j,k)*w3_x1(i,j,k)))/(nk-2)/(ni-2)/3;
   w_x2_w_x2(j)=w_x2_w_x2(j)+((w1_x2(i,j,k)*w1_x2(i,j,k))+(w2_x2(i,j,k)*w2_x2(i,j,k))+(w3_x2(i,j,k)*w3_x2(i,j,k)))/(nk-2)/(ni-2)/3;
   w_x3_w_x3(j)=w_x3_w_x3(j)+((w1_x3(i,j,k)*w1_x3(i,j,k))+(w2_x3(i,j,k)*w2_x3(i,j,k))+(w3_x3(i,j,k)*w3_x3(i,j,k)))/(nk-2)/(ni-2)/3;
   u_x2_v_x1(j)=u_x2_v_x1(j)+((u1_x2(i,j,k)*v1_x1(i,j,k))+(u2_x2(i,j,k)*v2_x1(i,j,k))+(u3_x2(i,j,k)*v3_x1(i,j,k)))/(nk-2)/(ni-2)/3;
   u_x3_w_x1(j)=u_x3_w_x1(j)+((u1_x3(i,j,k)*w1_x1(i,j,k))+(u2_x3(i,j,k)*w2_x1(i,j,k))+(u3_x3(i,j,k)*w3_x1(i,j,k)))/(nk-2)/(ni-2)/3;
   v_x3_w_x2(j)=v_x3_w_x2(j)+((v1_x3(i,j,k)*w1_x2(i,j,k))+(v2_x3(i,j,k)*w2_x2(i,j,k))+(v3_x3(i,j,k)*w3_x2(i,j,k)))/(nk-2)/(ni-2)/3;
end
end
end



for j=1:nj
    
    if j==nj
     production_rate(j)=0;
     dissipation_rate(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j)+u_x1_u_x1(j)+2*u_x2_v_x1(j)+2*u_x3_w_x1(j)+w_x3_w_x3(j)+v_x2_v_x2(j)+2*v_x3_w_x2(j));
     dissipation_of_the_mean(j)=0;
     pseudo_dissipation(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j));
     k(j)=1/2*(uu(j)+vv(j)+ww(j));
    
    elseif j==1
     production_rate(j)=-uv(j)*((u1mean(j+1)-u1mean(j))+(u2mean(j+1)-u2mean(j))+(u3mean(j+1)-u3mean(j)))/3/(y(j+1)-y(j));
     dissipation_rate(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j)+u_x1_u_x1(j)+2*u_x2_v_x1(j)+2*u_x3_w_x1(j)+w_x3_w_x3(j)+v_x2_v_x2(j)+2*v_x3_w_x2(j));
     dissipation_of_the_mean(j)=nu*(((u1mean(j+1)-u1mean(j))+(u2mean(j+1)-u2mean(j))+(u3mean(j+1)-u3mean(j)))/3/(y(j+1)-y(j)))^2;
     pseudo_dissipation(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j));
     k(j)=1/2*(uu(j)+vv(j)+ww(j));
    else
     production_rate(j)=-uv(j)*((u1mean(j+1)-u1mean(j-1))+(u2mean(j+1)-u2mean(j-1))+(u3mean(j+1)-u3mean(j-1)))/3/(y(j+1)-y(j-1));
     dissipation_rate(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j)+u_x1_u_x1(j)+2*u_x2_v_x1(j)+2*u_x3_w_x1(j)+w_x3_w_x3(j)+v_x2_v_x2(j)+2*v_x3_w_x2(j));
     dissipation_of_the_mean(j)=nu*(((u1mean(j+1)-u1mean(j-1))+(u2mean(j+1)-u2mean(j-1))+(u3mean(j+1)-u3mean(j-1)))/3/(y(j+1)-y(j-1)))^2;
     pseudo_dissipation(j)=nu*(u_x1_u_x1(j)+u_x2_u_x2(j)+u_x3_u_x3(j)+v_x1_v_x1(j)+v_x2_v_x2(j)+v_x3_v_x3(j)+w_x1_w_x1(j)+w_x2_w_x2(j)+w_x3_w_x3(j));
     k(j)=1/2*(uu(j)+vv(j)+ww(j));
    end

end


%figure(3)
% plot 
%plot(y_plus,  pseudo_dissipation)
%axis([0 500 0 5])
%xlabel('y+','fontsize',[20])
%ylabel(' pseudo dissipation','fontsize',[20])
%handle=gca;
%set(handle,'fontsize',[20])



for j=1:nj
    
   P_epsilon(j)= production_rate(j)/dissipation_rate(j); 
   
   if j==1
  Sk_epsilon(j)=((u1mean(j+1)-u1mean(j))+(u2mean(j+1)-u2mean(j))+(u3mean(j+1)-u3mean(j)))/3/(y(j+1)-y(j))*k(j)/dissipation_rate(j); 
   elseif j==nj
  Sk_epsilon(j)=0*k(j)/dissipation_rate(j); 
   else
  Sk_epsilon(j)=((u1mean(j+1)-u1mean(j-1))+(u2mean(j+1)-u2mean(j-1))+(u3mean(j+1)-u3mean(j-1)))/3/(y(j+1)-y(j-1))*k(j)/dissipation_rate(j); 
   end
end

%figure(4)
% plot 
%plot(y_plus,P_epsilon)
%axis([0 500 0 20])
%xlabel('y+','fontsize',[20])
%ylabel('Sk/epsilon','fontsize',[20])
%handle=gca;
%set(handle,'fontsize',[20])



