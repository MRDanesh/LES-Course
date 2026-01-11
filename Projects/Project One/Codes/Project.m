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
u2_filter_2n=f2(u2_3d,y,dx,dz,ni,nj,nk);
u3_filter_2n=f2(u3_3d,y,dx,dz,ni,nj,nk);
u1_filter_4n=f4(u1_3d,y,dx,dz,ni,nj,nk);
u2_filter_4n=f4(u2_3d,y,dx,dz,ni,nj,nk);
u3_filter_4n=f4(u3_3d,y,dx,dz,ni,nj,nk);
v1_filter_2n=f2(v1_3d,y,dx,dz,ni,nj,nk);
v2_filter_2n=f2(v2_3d,y,dx,dz,ni,nj,nk);
v3_filter_2n=f2(v3_3d,y,dx,dz,ni,nj,nk);
v1_filter_4n=f4(v1_3d,y,dx,dz,ni,nj,nk);
v2_filter_4n=f4(v2_3d,y,dx,dz,ni,nj,nk);
v3_filter_4n=f4(v3_3d,y,dx,dz,ni,nj,nk);
w1_filter_2n=f2(w1_3d,y,dx,dz,ni,nj,nk);
w2_filter_2n=f2(w2_3d,y,dx,dz,ni,nj,nk);
w3_filter_2n=f2(w3_3d,y,dx,dz,ni,nj,nk);
w1_filter_4n=f4(w1_3d,y,dx,dz,ni,nj,nk);
w2_filter_4n=f4(w2_3d,y,dx,dz,ni,nj,nk);
w3_filter_4n=f4(w3_3d,y,dx,dz,ni,nj,nk);

u1_double_filter_2n=f2(u1_filter_2n,y,dx,dz,ni,nj,nk);
u2_double_filter_2n=f2(u2_filter_2n,y,dx,dz,ni,nj,nk);
u3_double_filter_2n=f2(u3_filter_2n,y,dx,dz,ni,nj,nk);



u_filter_2n=zeros(ni,nj,nk);
v_filter_2n=zeros(ni,nj,nk);
w_filter_2n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk

    u_filter_2n(i,j,k)=(u1_filter_2n(i,j,k)+u2_filter_2n(i,j,k)+u3_filter_2n(i,j,k))/3;
    v_filter_2n(i,j,k)=(v1_filter_2n(i,j,k)+v2_filter_2n(i,j,k)+v3_filter_2n(i,j,k))/3;
    w_filter_2n(i,j,k)=(w1_filter_2n(i,j,k)+w2_filter_2n(i,j,k)+w3_filter_2n(i,j,k))/3;

end
end
end

u_double_filter_2n=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_double_filter_2n(i,j,k)=(u1_double_filter_2n(i,j,k)+u2_filter_2n(i,j,k)+u3_filter_2n(i,j,k))/3;

end
end
end

u_3d=zeros(ni,nj,nk);
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_3d(i,j,k)=(u1_3d(i,j,k)+u2_3d(i,j,k)+u3_3d(i,j,k))/3;

end
end
end

u_filter_mean(1:nj)=0;
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_mean(j)=u_filter_mean(j)+u_filter_2n(i,j,k)/ni/nk;
end
end
end


for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_4n(i,j,k)=(u1_filter_4n(i,j,k)+u2_filter_4n(i,j,k)+u3_filter_4n(i,j,k))/3;
    
    
end
end
end





u_double_filter_2n_y=u_double_filter_2n(ni/2,1:nj,nk/2);
u_filter_2n_y=u_filter_2n(48,1:nj,48);
u_3d_y=u_3d(ni/2,1:nj,nk/2);
u_filter_4n_y=u_filter_4n(ni/2,1:nj,nk/2);

plot(y,umeanj,'--','LineWidth',1.5);
hold on;
plot(y,u_3d_y,':','LineWidth',1.5);
hold on;
plot(y,u_filter_2n_y,'-','LineWidth',1.5 );
hold on;
plot(y,u_double_filter_2n_y,'-.','LineWidth',1.5);
hold on;
plot(y,u_filter_mean,'+','LineWidth',1.5);
hold on;
plot(y,u_filter_4n_y,'o','LineWidth',1.5);
hold on;
xlabel('y')
ylabel({'Velocity'},'Interpreter', 'LaTeX')
legend({'$\langle {U} \rangle $','U','$\bar{U}(n=2)$','$\bar {\bar{U}} (n=2)$','$\langle \bar{U} \rangle (n=2) $','$\bar{U}(n=4)$'},'Interpreter', 'LaTeX','FontSize',12)


%%

%%%%%%%%%%Part 1 Question 2%%%%%%%%%%%%%%%

u1fluc_filter_2n=f2(u1_fluc,y,dx,dz,ni,nj,nk);
u2fluc_filter_2n=f2(u2_fluc,y,dx,dz,ni,nj,nk);
u3fluc_filter_2n=f2(u3_fluc,y,dx,dz,ni,nj,nk);
u1fluc_filter_4n=f4(u1_fluc,y,dx,dz,ni,nj,nk);
u2fluc_filter_4n=f4(u2_fluc,y,dx,dz,ni,nj,nk);
u3fluc_filter_4n=f4(u3_fluc,y,dx,dz,ni,nj,nk);
v1fluc_filter_2n=f2(v1_fluc,y,dx,dz,ni,nj,nk);
v2fluc_filter_2n=f2(v2_fluc,y,dx,dz,ni,nj,nk);
v3fluc_filter_2n=f2(v3_fluc,y,dx,dz,ni,nj,nk);
v1fluc_filter_4n=f4(v1_fluc,y,dx,dz,ni,nj,nk);
v2fluc_filter_4n=f4(v2_fluc,y,dx,dz,ni,nj,nk);
v3fluc_filter_4n=f4(v3_fluc,y,dx,dz,ni,nj,nk);





u_filter_v_filter_2n(1:nj)=0;


for i=1:ni
for j=1:nj
for k=1:nk
    

    u_filter_v_filter_2n(j)= u_filter_v_filter_2n(j) +...
        (u1fluc_filter_2n(i,j,k)*v1fluc_filter_2n(i,j,k) +...
        u2fluc_filter_2n(i,j,k)*v2fluc_filter_2n(i,j,k) + ...
        u3fluc_filter_2n(i,j,k)*v3fluc_filter_2n(i,j,k))/3/ni/nk;
    
end
end
end






u_filter_v_filter_4n(1:nj)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_v_filter_4n(j)= u_filter_v_filter_4n(j) +...
        (u1fluc_filter_4n(i,j,k)*v1fluc_filter_4n(i,j,k) +...
        u2fluc_filter_4n(i,j,k)*v2fluc_filter_4n(i,j,k) + ...
        u3fluc_filter_4n(i,j,k)*v3fluc_filter_4n(i,j,k))/3/ni/nk;

end
end
end



plot(y,u_filter_v_filter_4n,'--','LineWidth',1.5);
hold on;
plot(y,u_filter_v_filter_2n,':','LineWidth',1.5);
hold on;
plot(y, Reynolds_uv,'-','LineWidth',1.5);
hold on;
xlabel('y')
ylabel({'uv'},'Interpreter', 'LaTeX')
legend({'$\langle \bar{u}\bar{v} \rangle (n=4)$','$\langle \bar{u}\bar{v} \rangle (n=2)$','$\langle uv \rangle $'},'Interpreter', 'LaTeX','FontSize',12)
%%

%%%%%%%%%%Part 1 Question 3%%%%%%%%%%%%%%


u1_v1_3d(1:ni,1:nj,1:nk)=0;
u2_v2_3d(1:ni,1:nj,1:nk)=0;
u3_v3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_v1_3d(i,j,k)= u1_v1_3d(i,j,k)+  u1_3d(i,j,k)*v1_3d(i,j,k);
    u2_v2_3d(i,j,k)= u2_v2_3d(i,j,k)+  u2_3d(i,j,k)*v2_3d(i,j,k);
    u3_v3_3d(i,j,k)= u3_v3_3d(i,j,k)+  u3_3d(i,j,k)*v3_3d(i,j,k);

end
end
end

u1_v1_filter_2n=f2(u1_v1_3d,y,dx,dz,ni,nj,nk);
u2_v2_filter_2n=f2(u2_v2_3d,y,dx,dz,ni,nj,nk);
u3_v3_filter_2n=f2(u3_v3_3d,y,dx,dz,ni,nj,nk);
u1_v1_filter_4n=f4(u1_v1_3d,y,dx,dz,ni,nj,nk);
u2_v2_filter_4n=f4(u2_v2_3d,y,dx,dz,ni,nj,nk);
u3_v3_filter_4n=f4(u3_v3_3d,y,dx,dz,ni,nj,nk);

for k=1:nk
for j=1:nj
for i=1:ni
TR_1_2n(i,j,k)=u1_v1_filter_2n(i,j,k) - u1_filter_2n(i,j,k)*v1_filter_2n(i,j,k);
TR_2_2n(i,j,k)=u2_v2_filter_2n(i,j,k) - u2_filter_2n(i,j,k)*v2_filter_2n(i,j,k);
TR_3_2n(i,j,k)=u3_v3_filter_2n(i,j,k) - u3_filter_2n(i,j,k)*v3_filter_2n(i,j,k);
TR_1_4n(i,j,k)=u1_v1_filter_4n(i,j,k) - u1_filter_4n(i,j,k)*v1_filter_4n(i,j,k);
TR_2_4n(i,j,k)=u2_v2_filter_4n(i,j,k) - u2_filter_4n(i,j,k)*v2_filter_4n(i,j,k);
TR_3_4n(i,j,k)=u3_v3_filter_4n(i,j,k) - u3_filter_4n(i,j,k)*v3_filter_4n(i,j,k);
end
end
end

TR12_2n(1:nj)=0;
TR12_4n(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj
TR12_2n(j)=TR12_2n(j)+((TR_1_2n(i,j,k)+TR_2_2n(i,j,k)+TR_3_2n(i,j,k)))/ni/nk/3;
TR12_4n(j)=TR12_4n(j)+((TR_1_4n(i,j,k)+TR_2_4n(i,j,k)+TR_3_4n(i,j,k)))/ni/nk/3;
end
end
end

plot(y,TR12_2n);
hold on;
plot(y,TR12_4n);
hold on;
plot(y,Reynolds_uv);
hold on;
xlabel('y')
ylabel({'uv'},'Interpreter', 'LaTeX')
legend({'$\langle \tau^{R}_{12} \rangle (n=2) $','$\langle \tau^{R}_{12} \rangle (n=4) $','$\langle uv \rangle $'},'Interpreter', 'LaTeX','FontSize',12)


%%%%%%%%%%%%% Part 1 Question 4 %%%%%%%%%%%%%%%

%%%%%%%%% first u_y %%%%%%%%%%5

%%



u1filter2n_grad_y(1:ni,1:nj,1:nk)=0;
u2filter2n_grad_y(1:ni,1:nj,1:nk)=0;
u3filter2n_grad_y(1:ni,1:nj,1:nk)=0;
u1filter4n_grad_y(1:ni,1:nj,1:nk)=0;
u2filter4n_grad_y(1:ni,1:nj,1:nk)=0;
u3filter4n_grad_y(1:ni,1:nj,1:nk)=0;
for i=1:ni
for j=1:nj-1
for k=1:nk
  
u1filter2n_grad_y(i,j,k) = u1filter2n_grad_y(i,j,k)+ (u1_filter_2n(i,j+1,k)-u1_filter_2n(i,j,k))/(y(j+1)-y(j));
u2filter2n_grad_y(i,j,k) = u2filter2n_grad_y(i,j,k)+ (u2_filter_2n(i,j+1,k)-u2_filter_2n(i,j,k))/(y(j+1)-y(j));
u3filter2n_grad_y(i,j,k) = u3filter2n_grad_y(i,j,k)+ (u3_filter_2n(i,j+1,k)-u3_filter_2n(i,j,k))/(y(j+1)-y(j));
u1filter4n_grad_y(i,j,k) = u1filter4n_grad_y(i,j,k)+ (u1_filter_4n(i,j+1,k)-u1_filter_4n(i,j,k))/(y(j+1)-y(j));
u2filter4n_grad_y(i,j,k) = u2filter4n_grad_y(i,j,k)+ (u2_filter_4n(i,j+1,k)-u2_filter_4n(i,j,k))/(y(j+1)-y(j));
u3filter4n_grad_y(i,j,k) = u3filter4n_grad_y(i,j,k)+ (u3_filter_4n(i,j+1,k)-u3_filter_4n(i,j,k))/(y(j+1)-y(j));

end
end
end



for i=1:ni
for j=nj
for k=1:nk
    
u1filter2n_grad_y(i,j,k) = 0;
u2filter2n_grad_y(i,j,k) = 0;
u3filter2n_grad_y(i,j,k) = 0;
u1filter4n_grad_y(i,j,k) = 0;
u2filter4n_grad_y(i,j,k) = 0;
u3filter4n_grad_y(i,j,k) = 0;

end
end
end





%%%%%%%% u_x %%%%%%%%%

u1filter2n_grad_x(1:ni,1:nj,1:nk)=0;
u2filter2n_grad_x(1:ni,1:nj,1:nk)=0;
u3filter2n_grad_x(1:ni,1:nj,1:nk)=0;
u1filter4n_grad_x(1:ni,1:nj,1:nk)=0;
u2filter4n_grad_x(1:ni,1:nj,1:nk)=0;
u3filter4n_grad_x(1:ni,1:nj,1:nk)=0;


for i=1:ni-1
for j=1:nj
for k=1:nk
    
u1filter2n_grad_x(i,j,k) = u1filter2n_grad_x(i,j,k)+ (u1_filter_2n(i+1,j,k)-u1_filter_2n(i,j,k))/(dx);
u2filter2n_grad_x(i,j,k) = u2filter2n_grad_x(i,j,k)+ (u2_filter_2n(i+1,j,k)-u2_filter_2n(i,j,k))/(dx);
u3filter2n_grad_x(i,j,k) = u3filter2n_grad_x(i,j,k)+ (u3_filter_2n(i+1,j,k)-u3_filter_2n(i,j,k))/(dx);    
u1filter4n_grad_x(i,j,k) = u1filter4n_grad_x(i,j,k)+ (u1_filter_4n(i+1,j,k)-u1_filter_4n(i,j,k))/(dx);
u2filter4n_grad_x(i,j,k) = u2filter4n_grad_x(i,j,k)+ (u2_filter_4n(i+1,j,k)-u2_filter_4n(i,j,k))/(dx);
u3filter4n_grad_x(i,j,k) = u3filter4n_grad_x(i,j,k)+ (u3_filter_4n(i+1,j,k)-u3_filter_4n(i,j,k))/(dx);    



end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
u1filter2n_grad_x(i,j,k) = u1filter2n_grad_x(i-1,j,k);
u2filter2n_grad_x(i,j,k) = u2filter2n_grad_x(i-1,j,k);
u3filter2n_grad_x(i,j,k) = u3filter2n_grad_x(i-1,j,k);
u1filter4n_grad_x(i,j,k) = u1filter4n_grad_x(i-1,j,k);
u2filter4n_grad_x(i,j,k) = u2filter4n_grad_x(i-1,j,k);
u3filter4n_grad_x(i,j,k) = u3filter4n_grad_x(i-1,j,k);

end
end
end




%%%%%%%%%% u-z %%%%%%%%%


u1filter2n_grad_z(1:ni,1:nj,1:nk)=0;
u2filter2n_grad_z(1:ni,1:nj,1:nk)=0;
u3filter2n_grad_z(1:ni,1:nj,1:nk)=0;
u1filter4n_grad_z(1:ni,1:nj,1:nk)=0;
u2filter4n_grad_z(1:ni,1:nj,1:nk)=0;
u3filter4n_grad_z(1:ni,1:nj,1:nk)=0;


for i=1:ni
for j=1:nj
for k=1:nk-1
    
u1filter2n_grad_z(i,j,k) = u1filter2n_grad_z(i,j,k)+ (u1_filter_2n(i,j,k+1)-u1_filter_2n(i,j,k))/(dz);
u2filter2n_grad_z(i,j,k) = u2filter2n_grad_z(i,j,k)+ (u2_filter_2n(i,j,k+1)-u2_filter_2n(i,j,k))/(dz);
u3filter2n_grad_z(i,j,k) = u3filter2n_grad_z(i,j,k)+ (u3_filter_2n(i,j,k+1)-u3_filter_2n(i,j,k))/(dz);    
u1filter4n_grad_z(i,j,k) = u1filter4n_grad_z(i,j,k)+ (u1_filter_4n(i,j,k+1)-u1_filter_4n(i,j,k))/(dz);
u2filter4n_grad_z(i,j,k) = u2filter4n_grad_z(i,j,k)+ (u2_filter_4n(i,j,k+1)-u2_filter_4n(i,j,k))/(dz);
u3filter4n_grad_z(i,j,k) = u3filter4n_grad_z(i,j,k)+ (u3_filter_4n(i,j,k+1)-u3_filter_4n(i,j,k))/(dz);    


end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
u1filter2n_grad_z(i,j,k) = u1filter2n_grad_z(i,j,k-1);
u2filter2n_grad_z(i,j,k) = u2filter2n_grad_z(i,j,k-1);
u3filter2n_grad_z(i,j,k) = u3filter2n_grad_z(i,j,k-1);
u1filter4n_grad_z(i,j,k) = u1filter4n_grad_z(i,j,k-1);
u2filter4n_grad_z(i,j,k) = u2filter4n_grad_z(i,j,k-1);
u3filter4n_grad_z(i,j,k) = u3filter4n_grad_z(i,j,k-1);

end
end
end




%%%%%%%%%%% v_x %%%%%%%%%%%%


v1filter2n_grad_x(1:ni,1:nj,1:nk)=0;
v2filter2n_grad_x(1:ni,1:nj,1:nk)=0;
v3filter2n_grad_x(1:ni,1:nj,1:nk)=0;
v1filter4n_grad_x(1:ni,1:nj,1:nk)=0;
v2filter4n_grad_x(1:ni,1:nj,1:nk)=0;
v3filter4n_grad_x(1:ni,1:nj,1:nk)=0;



for i=1:ni-1
for j=1:nj
for k=1:nk
    
v1filter2n_grad_x(i,j,k) = v1filter2n_grad_x(i,j,k)+ (v1_filter_2n(i+1,j,k)-v1_filter_2n(i,j,k))/(dx);
v2filter2n_grad_x(i,j,k) = v2filter2n_grad_x(i,j,k)+ (v2_filter_2n(i+1,j,k)-v2_filter_2n(i,j,k))/(dx);
v3filter2n_grad_x(i,j,k) = v3filter2n_grad_x(i,j,k)+ (v3_filter_2n(i+1,j,k)-v3_filter_2n(i,j,k))/(dx);    
v1filter4n_grad_x(i,j,k) = v1filter4n_grad_x(i,j,k)+ (v1_filter_4n(i+1,j,k)-v1_filter_4n(i,j,k))/(dx);
v2filter4n_grad_x(i,j,k) = v2filter4n_grad_x(i,j,k)+ (v2_filter_4n(i+1,j,k)-v2_filter_4n(i,j,k))/(dx);
v3filter4n_grad_x(i,j,k) = v3filter4n_grad_x(i,j,k)+ (v3_filter_4n(i+1,j,k)-v3_filter_4n(i,j,k))/(dx);    


end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
v1filter2n_grad_x(i,j,k) = v1filter2n_grad_x(i-1,j,k);
v2filter2n_grad_x(i,j,k) = v2filter2n_grad_x(i-1,j,k);
v3filter2n_grad_x(i,j,k) = v3filter2n_grad_x(i-1,j,k);
v1filter4n_grad_x(i,j,k) = v1filter4n_grad_x(i-1,j,k);
v2filter4n_grad_x(i,j,k) = v2filter4n_grad_x(i-1,j,k);
v3filter4n_grad_x(i,j,k) = v3filter4n_grad_x(i-1,j,k);
end
end
end



%%%%%%%%% v_y %%%%%%%%%

v1filter2n_grad_y(1:ni,1:nj,1:nk)=0;
v2filter2n_grad_y(1:ni,1:nj,1:nk)=0;
v3filter2n_grad_y(1:ni,1:nj,1:nk)=0;
v1filter4n_grad_y(1:ni,1:nj,1:nk)=0;
v2filter4n_grad_y(1:ni,1:nj,1:nk)=0;
v3filter4n_grad_y(1:ni,1:nj,1:nk)=0;


for i=1:ni
for j=1:nj-1
for k=1:nk
  
v1filter2n_grad_y(i,j,k) = v1filter2n_grad_y(i,j,k)+ (v1_filter_2n(i,j+1,k)-v1_filter_2n(i,j,k))/(y(j+1)-y(j));
v2filter2n_grad_y(i,j,k) = v2filter2n_grad_y(i,j,k)+ (v2_filter_2n(i,j+1,k)-v2_filter_2n(i,j,k))/(y(j+1)-y(j));
v3filter2n_grad_y(i,j,k) = v3filter2n_grad_y(i,j,k)+ (v3_filter_2n(i,j+1,k)-v3_filter_2n(i,j,k))/(y(j+1)-y(j));
v1filter4n_grad_y(i,j,k) = v1filter4n_grad_y(i,j,k)+ (v1_filter_4n(i,j+1,k)-v1_filter_4n(i,j,k))/(y(j+1)-y(j));
v2filter4n_grad_y(i,j,k) = v2filter4n_grad_y(i,j,k)+ (v2_filter_4n(i,j+1,k)-v2_filter_4n(i,j,k))/(y(j+1)-y(j));
v3filter4n_grad_y(i,j,k) = v3filter4n_grad_y(i,j,k)+ (v3_filter_4n(i,j+1,k)-v3_filter_4n(i,j,k))/(y(j+1)-y(j));

end
end
end

for i=1:ni
for j=nj
for k=1:nk
    
v1filter2n_grad_y(i,j,k) = 0;
v2filter2n_grad_y(i,j,k) = 0;
v3filter2n_grad_y(i,j,k) = 0;

end
end
end




%%%%%%%%%%%%  v-z %%%%%%%%%%%%%%%

v1filter2n_grad_z(1:ni,1:nj,1:nk)=0;
v2filter2n_grad_z(1:ni,1:nj,1:nk)=0;
v3filter2n_grad_z(1:ni,1:nj,1:nk)=0;
v1filter4n_grad_z(1:ni,1:nj,1:nk)=0;
v2filter4n_grad_z(1:ni,1:nj,1:nk)=0;
v3filter4n_grad_z(1:ni,1:nj,1:nk)=0;



for i=1:ni
for j=1:nj
for k=1:nk-1
    
v1filter2n_grad_z(i,j,k) = v1filter2n_grad_z(i,j,k)+ (v1_filter_2n(i,j,k+1)-v1_filter_2n(i,j,k))/(dz);
v2filter2n_grad_z(i,j,k) = v2filter2n_grad_z(i,j,k)+ (v2_filter_2n(i,j,k+1)-v2_filter_2n(i,j,k))/(dz);
v3filter2n_grad_z(i,j,k) = v3filter2n_grad_z(i,j,k)+ (v3_filter_2n(i,j,k+1)-v3_filter_2n(i,j,k))/(dz);    
v1filter4n_grad_z(i,j,k) = v1filter4n_grad_z(i,j,k)+ (v1_filter_4n(i,j,k+1)-v1_filter_4n(i,j,k))/(dz);
v2filter4n_grad_z(i,j,k) = v2filter4n_grad_z(i,j,k)+ (v2_filter_4n(i,j,k+1)-v2_filter_4n(i,j,k))/(dz);
v3filter4n_grad_z(i,j,k) = v3filter4n_grad_z(i,j,k)+ (v3_filter_4n(i,j,k+1)-v3_filter_4n(i,j,k))/(dz);    


end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
v1filter2n_grad_z(i,j,k) = v1filter2n_grad_z(i,j,k-1);
v2filter2n_grad_z(i,j,k) = v2filter2n_grad_z(i,j,k-1);
v3filter2n_grad_z(i,j,k) = v3filter2n_grad_z(i,j,k-1);
v1filter4n_grad_z(i,j,k) = v1filter4n_grad_z(i,j,k-1);
v2filter4n_grad_z(i,j,k) = v2filter4n_grad_z(i,j,k-1);
v3filter4n_grad_z(i,j,k) = v3filter4n_grad_z(i,j,k-1);

end
end
end




%%%%%%%%%%%%%% w-x %%%%%%%%%%%%%%

w1filter2n_grad_x(1:ni,1:nj,1:nk)=0;
w2filter2n_grad_x(1:ni,1:nj,1:nk)=0;
w3filter2n_grad_x(1:ni,1:nj,1:nk)=0;
w1filter4n_grad_x(1:ni,1:nj,1:nk)=0;
w2filter4n_grad_x(1:ni,1:nj,1:nk)=0;
w3filter4n_grad_x(1:ni,1:nj,1:nk)=0;


for i=1:ni-1
for j=1:nj
for k=1:nk
    
w1filter2n_grad_x(i,j,k) = w1filter2n_grad_x(i,j,k)+ (w1_filter_2n(i+1,j,k)-w1_filter_2n(i,j,k))/(dx);
w2filter2n_grad_x(i,j,k) = w2filter2n_grad_x(i,j,k)+ (w2_filter_2n(i+1,j,k)-w2_filter_2n(i,j,k))/(dx);
w3filter2n_grad_x(i,j,k) = w3filter2n_grad_x(i,j,k)+ (w3_filter_2n(i+1,j,k)-w3_filter_2n(i,j,k))/(dx);    
w1filter4n_grad_x(i,j,k) = w1filter4n_grad_x(i,j,k)+ (w1_filter_4n(i+1,j,k)-w1_filter_4n(i,j,k))/(dx);
w2filter4n_grad_x(i,j,k) = w2filter4n_grad_x(i,j,k)+ (w2_filter_4n(i+1,j,k)-w2_filter_4n(i,j,k))/(dx);
w3filter4n_grad_x(i,j,k) = w3filter4n_grad_x(i,j,k)+ (w3_filter_4n(i+1,j,k)-w3_filter_4n(i,j,k))/(dx);    


end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
w1filter2n_grad_x(i,j,k) = w1filter2n_grad_x(i-1,j,k);
w2filter2n_grad_x(i,j,k) = w2filter2n_grad_x(i-1,j,k);
w3filter2n_grad_x(i,j,k) = w3filter2n_grad_x(i-1,j,k);
w1filter4n_grad_x(i,j,k) = w1filter4n_grad_x(i-1,j,k);
w2filter4n_grad_x(i,j,k) = w2filter4n_grad_x(i-1,j,k);
w3filter4n_grad_x(i,j,k) = w3filter4n_grad_x(i-1,j,k);
end
end
end




%%%%%%%%%%%%%% w_y %%%%%%%%%%%%%%

w1filter2n_grad_y(1:ni,1:nj,1:nk)=0;
w2filter2n_grad_y(1:ni,1:nj,1:nk)=0;
w3filter2n_grad_y(1:ni,1:nj,1:nk)=0;
w1filter4n_grad_y(1:ni,1:nj,1:nk)=0;
w2filter4n_grad_y(1:ni,1:nj,1:nk)=0;
w3filter4n_grad_y(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj-1
for k=1:nk
  
w1filter2n_grad_y(i,j,k) = w1filter2n_grad_y(i,j,k)+ (w1_filter_2n(i,j+1,k)-w1_filter_2n(i,j,k))/(y(j+1)-y(j));
w2filter2n_grad_y(i,j,k) = w2filter2n_grad_y(i,j,k)+ (w2_filter_2n(i,j+1,k)-w2_filter_2n(i,j,k))/(y(j+1)-y(j));
w3filter2n_grad_y(i,j,k) = w3filter2n_grad_y(i,j,k)+ (w3_filter_2n(i,j+1,k)-w3_filter_2n(i,j,k))/(y(j+1)-y(j));
w1filter4n_grad_y(i,j,k) = w1filter4n_grad_y(i,j,k)+ (w1_filter_4n(i,j+1,k)-w1_filter_4n(i,j,k))/(y(j+1)-y(j));
w2filter4n_grad_y(i,j,k) = w2filter4n_grad_y(i,j,k)+ (w2_filter_4n(i,j+1,k)-w2_filter_4n(i,j,k))/(y(j+1)-y(j));
w3filter4n_grad_y(i,j,k) = w3filter4n_grad_y(i,j,k)+ (w3_filter_4n(i,j+1,k)-w3_filter_4n(i,j,k))/(y(j+1)-y(j));

end
end
end

for i=1:ni
for j=nj
for k=1:nk
    
w1filter2n_grad_y(i,j,k) = 0;
w2filter2n_grad_y(i,j,k) = 0;
w3filter2n_grad_y(i,j,k) = 0;
w1filter4n_grad_y(i,j,k) = 0;
w2filter4n_grad_y(i,j,k) = 0;
w3filter4n_grad_y(i,j,k) = 0;

end
end
end




%%%%%%%%%%%% w_z %%%%%%%%%%

w1filter2n_grad_z(1:ni,1:nj,1:nk)=0;
w2filter2n_grad_z(1:ni,1:nj,1:nk)=0;
w3filter2n_grad_z(1:ni,1:nj,1:nk)=0;
w1filter4n_grad_z(1:ni,1:nj,1:nk)=0;
w2filter4n_grad_z(1:ni,1:nj,1:nk)=0;
w3filter4n_grad_z(1:ni,1:nj,1:nk)=0;



for i=1:ni
for j=1:nj
for k=1:nk-1
    
w1filter2n_grad_z(i,j,k) = w1filter2n_grad_z(i,j,k)+ (w1_filter_2n(i,j,k+1)-w1_filter_2n(i,j,k))/(dz);
w2filter2n_grad_z(i,j,k) = w2filter2n_grad_z(i,j,k)+ (w2_filter_2n(i,j,k+1)-w2_filter_2n(i,j,k))/(dz);
w3filter2n_grad_z(i,j,k) = w3filter2n_grad_z(i,j,k)+ (w3_filter_2n(i,j,k+1)-w3_filter_2n(i,j,k))/(dz);    
w1filter4n_grad_z(i,j,k) = w1filter4n_grad_z(i,j,k)+ (w1_filter_4n(i,j,k+1)-w1_filter_4n(i,j,k))/(dz);
w2filter4n_grad_z(i,j,k) = w2filter4n_grad_z(i,j,k)+ (w2_filter_4n(i,j,k+1)-w2_filter_4n(i,j,k))/(dz);
w3filter4n_grad_z(i,j,k) = w3filter4n_grad_z(i,j,k)+ (w3_filter_4n(i,j,k+1)-w3_filter_4n(i,j,k))/(dz);    



end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
w1filter2n_grad_z(i,j,k) = w1filter2n_grad_z(i,j,k-1);
w2filter2n_grad_z(i,j,k) = w2filter2n_grad_z(i,j,k-1);
w3filter2n_grad_z(i,j,k) = w3filter2n_grad_z(i,j,k-1);
w1filter4n_grad_z(i,j,k) = w1filter4n_grad_z(i,j,k-1);
w2filter4n_grad_z(i,j,k) = w2filter4n_grad_z(i,j,k-1);
w3filter4n_grad_z(i,j,k) = w3filter4n_grad_z(i,j,k-1);

end
end
end








S11_2n(1:ni,1:nj,1:nk)=0;
S12_2n(1:ni,1:nj,1:nk)=0;
S13_2n(1:ni,1:nj,1:nk)=0;
S21_2n(1:ni,1:nj,1:nk)=0;
S22_2n(1:ni,1:nj,1:nk)=0;
S23_2n(1:ni,1:nj,1:nk)=0;
S31_2n(1:ni,1:nj,1:nk)=0;
S32_2n(1:ni,1:nj,1:nk)=0;
S33_2n(1:ni,1:nj,1:nk)=0;

S11_4n(1:ni,1:nj,1:nk)=0;
S12_4n(1:ni,1:nj,1:nk)=0;
S13_4n(1:ni,1:nj,1:nk)=0;
S21_4n(1:ni,1:nj,1:nk)=0;
S22_4n(1:ni,1:nj,1:nk)=0;
S23_4n(1:ni,1:nj,1:nk)=0;
S31_4n(1:ni,1:nj,1:nk)=0;
S32_4n(1:ni,1:nj,1:nk)=0;
S33_4n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
    S11_2n(i,j,k)=S11_2n(i,j,k)+((u1filter2n_grad_x(i,j,k)+ u2filter2n_grad_x(i,j,k) + u3filter2n_grad_x(i,j,k)))/3;
    S12_2n(i,j,k)=S12_2n(i,j,k)+(0.5*(u1filter2n_grad_y(i,j,k)+ u2filter2n_grad_y(i,j,k) + u3filter2n_grad_y(i,j,k)+v1filter2n_grad_x(i,j,k)+ v2filter2n_grad_x(i,j,k) + v3filter2n_grad_x(i,j,k)))/3;
    S13_2n(i,j,k)=S13_2n(i,j,k)+(0.5*(u1filter2n_grad_z(i,j,k)+ u2filter2n_grad_z(i,j,k) + u3filter2n_grad_z(i,j,k)+w1filter2n_grad_x(i,j,k)+ w2filter2n_grad_x(i,j,k) + w3filter2n_grad_x(i,j,k)))/3;
    S23_2n(i,j,k)=S23_2n(i,j,k)+(0.5*(v1filter2n_grad_z(i,j,k)+ v2filter2n_grad_z(i,j,k) + v3filter2n_grad_z(i,j,k)+w1filter2n_grad_y(i,j,k)+ w2filter2n_grad_y(i,j,k) + w3filter2n_grad_y(i,j,k)))/3;
    S22_2n(i,j,k)=S22_2n(i,j,k)+((v1filter2n_grad_y(i,j,k)+ v2filter2n_grad_y(i,j,k) + v3filter2n_grad_y(i,j,k)))/3;
    S33_2n(i,j,k)=S22_2n(i,j,k)+((w1filter2n_grad_z(i,j,k)+ w2filter2n_grad_z(i,j,k) + w3filter2n_grad_z(i,j,k)))/3;
    S21_2n(i,j,k)=S12_2n(i,j,k);
    S31_2n(i,j,k)=S13_2n(i,j,k);
    S32_2n(i,j,k)=S23_2n(i,j,k);
end
end
end

 S12_2n_y(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj

    S12_2n_y(j)=S12_2n_y(j)+ S12_2n(i,j,k)/ni/nk;

end
end
end

for k=1:nk
for i=1:ni
for j=1:nj
    S11_4n(i,j,k)=S11_4n(i,j,k)+((u1filter4n_grad_x(i,j,k)+ u2filter4n_grad_x(i,j,k) + u3filter4n_grad_x(i,j,k)))/3;
    S12_4n(i,j,k)=S12_4n(i,j,k)+(0.5*(u1filter4n_grad_y(i,j,k)+ u2filter4n_grad_y(i,j,k) + u3filter4n_grad_y(i,j,k)+v1filter4n_grad_x(i,j,k)+ v2filter4n_grad_x(i,j,k) + v3filter4n_grad_x(i,j,k)))/3;
    S13_4n(i,j,k)=S13_4n(i,j,k)+(0.5*(u1filter4n_grad_z(i,j,k)+ u2filter4n_grad_z(i,j,k) + u3filter4n_grad_z(i,j,k)+w1filter4n_grad_x(i,j,k)+ w2filter4n_grad_x(i,j,k) + w3filter4n_grad_x(i,j,k)))/3;
    S23_4n(i,j,k)=S23_4n(i,j,k)+(0.5*(v1filter4n_grad_z(i,j,k)+ v2filter4n_grad_z(i,j,k) + v3filter4n_grad_z(i,j,k)+w1filter4n_grad_y(i,j,k)+ w2filter4n_grad_y(i,j,k) + w3filter4n_grad_y(i,j,k)))/3;
    S22_4n(i,j,k)=S22_4n(i,j,k)+((v1filter4n_grad_y(i,j,k)+ v2filter4n_grad_y(i,j,k) + v3filter4n_grad_y(i,j,k)))/3;
    S33_4n(i,j,k)=S22_4n(i,j,k)+((w1filter4n_grad_z(i,j,k)+ w2filter4n_grad_z(i,j,k) + w3filter4n_grad_z(i,j,k)))/3;
    S21_4n(i,j,k)=S12_4n(i,j,k);
    S31_4n(i,j,k)=S13_4n(i,j,k);
    S32_4n(i,j,k)=S23_4n(i,j,k);
end
end
end

 S12_4n_y(1:nj)=0;
for k=1:nk
for i=1:ni
for j=1:nj

    S12_4n_y(j)=S12_4n_y(j)+ S12_4n(i,j,k)/ni/nk;

end
end
end



plot(y,S12_2n_y);
hold on;
plot(y,S12_4n_y);
hold on;
xlabel('y')
ylabel({'$\langle \bar S_{12} \rangle $'},'Interpreter', 'LaTeX')
legend({'$ n=2 $','$n=4$'},'Interpreter', 'LaTeX','FontSize',12)

%%
%%%%%%%% Part 2 Question 1 %%%%%%%%%

%%% First Static Smagorinsky %%%%%


 S_mag_2n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
    
    S_mag_2n(i,j,k)= S_mag_2n(i,j,k)+ S11_2n(i,j,k)*S11_2n(i,j,k) + S12_2n(i,j,k)*S12_2n(i,j,k)+...
    S13_2n(i,j,k)*S13_2n(i,j,k)+ S21_2n(i,j,k)*S21_2n(i,j,k)+S22_2n(i,j,k)*S22_2n(i,j,k)+...
    S23_2n(i,j,k)*S23_2n(i,j,k) + S31_2n(i,j,k)*S31_2n(i,j,k)+ S32_2n(i,j,k)*S32_2n(i,j,k)+...
    S33_2n(i,j,k)*S33_2n(i,j,k);
    
end
end
end

S_mag_4n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
    
    S_mag_4n(i,j,k)= S_mag_4n(i,j,k)+ S11_4n(i,j,k)*S11_4n(i,j,k) + S12_4n(i,j,k)*S12_4n(i,j,k)+...
    S13_4n(i,j,k)*S13_4n(i,j,k)+ S21_4n(i,j,k)*S21_4n(i,j,k)+S22_4n(i,j,k)*S22_4n(i,j,k)+...
    S23_4n(i,j,k)*S23_4n(i,j,k) + S31_4n(i,j,k)*S31_4n(i,j,k)+ S32_4n(i,j,k)*S32_4n(i,j,k)+...
    S33_4n(i,j,k)*S33_4n(i,j,k);
    
end
end
end




S_bar_2n(1:ni,i:nj,1:nk)=0;
S_bar_4n(1:ni,i:nj,1:nk)=0;
for k=1:nk
for i=1:ni
for j=1:nj
    
    S_bar_2n(i,j,k)= ( 2*S_mag_2n(i,j,k) )^(0.5);
       S_bar_4n(i,j,k)= ( 2*S_mag_4n(i,j,k) )^(0.5);

end
end
end



delta_bar(1:nj)=0;
for j=2:nj-1
    
    delta_bar(j)= (4*dx*dz*(y(j+1)-y(j-1)))^(1/3);
end

 delta_bar(nj)= (4*dx*dz*(y(j)-y(j-1)))^(1/3);

 
 
 delta_tilda(1:nj)=0;
for j=3:nj-2
    
    delta_tilda(j)= (16*dx*dz*(y(j+2)-y(j-2)))^(1/3);
end

delta_tilda(nj)= (16*dx*dz*(y(j)-y(j-2)))^(1/3);
delta_tilda(nj-1)= (16*dx*dz*(y(j+1)-y(j-2)))^(1/3);
delta_tilda(2)= (16*dx*dz*(y(4)-y(1)))^(1/3);

%%%%%
 
 Cs_Static = 0.05;
 
 TR12_2n_Smago_Static (1:nj)=0;
  TR12_4n_Smago_Static (1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
 TR12_2n_Smago_Static (j) = TR12_2n_Smago_Static (j) -2*Cs_Static*Cs_Static*((delta_bar(j))^2) *S_bar_2n(i,j,k)*S12_2n(i,j,k)/ni/nk;
 TR12_4n_Smago_Static (j) = TR12_4n_Smago_Static (j) -2*Cs_Static*Cs_Static*((delta_tilda(j))^2) *S_bar_4n(i,j,k)*S12_4n(i,j,k)/ni/nk;
 
 end
 end
 end
 
 %%%%%% Dynamic Smagorinsky %%%%%%%%%%
 
 
%%%%

delta_double_filter(1:nj)=0;
for j=1:nj
    
    %delta_double_filter(j)= (delta_bar(j)^(2) + delta_tilda(j)^(2))^(1/2);
    delta_double_filter(j)=delta_tilda(j);
end

S11_double_filter= f4(S11_2n,y,dx,dz,ni,nj,nk);
S12_double_filter= f4(S12_2n,y,dx,dz,ni,nj,nk);
S13_double_filter= f4(S13_2n,y,dx,dz,ni,nj,nk);
S22_double_filter= f4(S22_2n,y,dx,dz,ni,nj,nk);
S23_double_filter= f4(S23_2n,y,dx,dz,ni,nj,nk);
S33_double_filter= f4(S33_2n,y,dx,dz,ni,nj,nk);
S_double_filter= f4(S_bar_2n,y,dx,dz,ni,nj,nk);

%%%%% Calculating Mij%%%%%%%%

 for k=1:nk
 for i=1:ni
 for j=1:nj
    A(i,j,k)= 2*((delta_bar(j))^(2))* S_bar_2n(i,j,k)*S11_2n(i,j,k); 
    B(i,j,k)= 2*((delta_bar(j))^(2))*S_bar_2n(i,j,k)*S12_2n(i,j,k);
    C(i,j,k)= 2*((delta_bar(j))^(2))* S_bar_2n(i,j,k)*S13_2n(i,j,k);
    D(i,j,k)= 2*((delta_bar(j))^(2))*S_bar_2n(i,j,k)*S22_2n(i,j,k);
    E(i,j,k)= 2*((delta_bar(j))^(2))* S_bar_2n(i,j,k)*S23_2n(i,j,k);
    F(i,j,k)= 2*((delta_bar(j))^(2))*S_bar_2n(i,j,k)*S33_2n(i,j,k);
 end
 end
 end
 
 M11_A=f4(A,y,dx,dz,ni,nj,nk);
 M12_A=f4(B,y,dx,dz,ni,nj,nk);
 M13_A=f4(C,y,dx,dz,ni,nj,nk);
 M22_A=f4(D,y,dx,dz,ni,nj,nk);
 M23_A=f4(E,y,dx,dz,ni,nj,nk);
 M33_A=f4(F,y,dx,dz,ni,nj,nk);
 M21_A=f4(B,y,dx,dz,ni,nj,nk);
 M31_A=f4(C,y,dx,dz,ni,nj,nk);
 M32_A=f4(E,y,dx,dz,ni,nj,nk);
 
 for k=1:nk
 for i=1:ni
 for j=1:nj
      M11_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S11_double_filter(i,j,k);
      M12_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S12_double_filter(i,j,k);
      M13_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S13_double_filter(i,j,k);
      M22_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S22_double_filter(i,j,k);
      M23_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S23_double_filter(i,j,k);
      M33_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S33_double_filter(i,j,k);
      M21_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S12_double_filter(i,j,k);
      M31_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S13_double_filter(i,j,k);
      M32_B(i,j,k)=2*((delta_double_filter(j))^(2))*S_double_filter(i,j,k)*S23_double_filter(i,j,k);
 end
 end
 end
 
 for k=1:nk
 for i=1:ni
 for j=1:nj
     M11(i,j,k)=M11_A(i,j,k)-M11_B(i,j,k);
     M12(i,j,k)=M12_A(i,j,k)-M12_B(i,j,k);
     M13(i,j,k)=M13_A(i,j,k)-M13_B(i,j,k);
     M22(i,j,k)=M22_A(i,j,k)-M22_B(i,j,k);
     M23(i,j,k)=M23_A(i,j,k)-M23_B(i,j,k);
     M33(i,j,k)=M33_A(i,j,k)-M33_B(i,j,k);
     M21(i,j,k)=M12_A(i,j,k)-M12_B(i,j,k);
     M31(i,j,k)=M13_A(i,j,k)-M13_B(i,j,k);
     M32(i,j,k)=M23_A(i,j,k)-M23_B(i,j,k);
 end
 end
 end
 
 
 
u_filter_u_filter(1:ni,1:nj,1:nk)=0;
u_filter_v_filter(1:ni,1:nj,1:nk)=0;
u_filter_w_filter(1:ni,1:nj,1:nk)=0;
v_filter_v_filter(1:ni,1:nj,1:nk)=0;
v_filter_w_filter(1:ni,1:nj,1:nk)=0;
w_filter_w_filter(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u_filter_u_filter(i,j,k)= u_filter_u_filter(i,j,k) +...
        (u1_filter_2n(i,j,k)*u1_filter_2n(i,j,k) +...
        u2_filter_2n(i,j,k)*u2_filter_2n(i,j,k) + ...
        u3_filter_2n(i,j,k)*u3_filter_2n(i,j,k))/3;

    u_filter_v_filter(i,j,k)= u_filter_v_filter(i,j,k) +...
        (u1_filter_2n(i,j,k)*v1_filter_2n(i,j,k) +...
        u2_filter_2n(i,j,k)*v2_filter_2n(i,j,k) + ...
        u3_filter_2n(i,j,k)*v3_filter_2n(i,j,k))/3;
    
    
    u_filter_w_filter(i,j,k)= u_filter_w_filter(i,j,k) +...
        (u1_filter_2n(i,j,k)*w1_filter_2n(i,j,k) +...
        u2_filter_2n(i,j,k)*w2_filter_2n(i,j,k) + ...
        u3_filter_2n(i,j,k)*w3_filter_2n(i,j,k))/3;
    
    v_filter_v_filter(i,j,k)= v_filter_v_filter(i,j,k) +...
        (v1_filter_2n(i,j,k)*v1_filter_2n(i,j,k) +...
        v2_filter_2n(i,j,k)*v2_filter_2n(i,j,k) + ...
        v3_filter_2n(i,j,k)*v3_filter_2n(i,j,k))/3;
    
    v_filter_w_filter(i,j,k)= v_filter_w_filter(i,j,k) +...
        (w1_filter_2n(i,j,k)*v1_filter_2n(i,j,k) +...
        w2_filter_2n(i,j,k)*v2_filter_2n(i,j,k) + ...
        w3_filter_2n(i,j,k)*v3_filter_2n(i,j,k))/3;
    
    w_filter_w_filter(i,j,k)= w_filter_w_filter(i,j,k) +...
        (w1_filter_2n(i,j,k)*w1_filter_2n(i,j,k) +...
        w2_filter_2n(i,j,k)*w2_filter_2n(i,j,k) + ...
        w3_filter_2n(i,j,k)*w3_filter_2n(i,j,k))/3;
end
end
end

 
 u_filter_u_filter_tilda= f4(u_filter_u_filter,y,dx,dz,ni,nj,nk);
 u_filter_v_filter_tilda= f4(u_filter_v_filter,y,dx,dz,ni,nj,nk);
 u_filter_w_filter_tilda= f4(u_filter_w_filter,y,dx,dz,ni,nj,nk);
 v_filter_v_filter_tilda= f4(v_filter_v_filter,y,dx,dz,ni,nj,nk);
 v_filter_w_filter_tilda= f4(v_filter_w_filter,y,dx,dz,ni,nj,nk);
 w_filter_w_filter_tilda= f4(w_filter_w_filter,y,dx,dz,ni,nj,nk);
 
 
 u_double_filter=f4(u_filter_2n,y,dx,dz,ni,nj,nk);
 v_double_filter=f4(v_filter_2n,y,dx,dz,ni,nj,nk);
 w_double_filter=f4(w_filter_2n,y,dx,dz,ni,nj,nk);

 
for i=1:ni
for j=1:nj
for k=1:nk
    
    u_double_filter_u_double_filter(i,j,k) = u_double_filter(i,j,k)*u_double_filter(i,j,k);
    u_double_filter_v_double_filter(i,j,k) = u_double_filter(i,j,k)*v_double_filter(i,j,k);
    u_double_filter_w_double_filter(i,j,k) = u_double_filter(i,j,k)*w_double_filter(i,j,k);
    v_double_filter_v_double_filter(i,j,k) = v_double_filter(i,j,k)*v_double_filter(i,j,k);
    v_double_filter_w_double_filter(i,j,k) = v_double_filter(i,j,k)*w_double_filter(i,j,k);
    w_double_filter_w_double_filter(i,j,k) = w_double_filter(i,j,k)*w_double_filter(i,j,k);
   
end
end
end

 
for i=1:ni
for j=1:nj
for k=1:nk
    
    L11(i,j,k)=u_filter_u_filter_tilda(i,j,k)-u_double_filter_u_double_filter(i,j,k);
    L12(i,j,k)=u_filter_v_filter_tilda(i,j,k)-u_double_filter_v_double_filter(i,j,k);
    L13(i,j,k)=u_filter_w_filter_tilda(i,j,k)-u_double_filter_w_double_filter(i,j,k);
    L22(i,j,k)=v_filter_v_filter_tilda(i,j,k)-v_double_filter_v_double_filter(i,j,k);
    L23(i,j,k)=v_filter_w_filter_tilda(i,j,k)-v_double_filter_w_double_filter(i,j,k);
    L33(i,j,k)=w_filter_w_filter_tilda(i,j,k)-w_double_filter_w_double_filter(i,j,k);
    L21(i,j,k)=u_filter_v_filter_tilda(i,j,k)-u_double_filter_v_double_filter(i,j,k);
    L31(i,j,k)=u_filter_w_filter_tilda(i,j,k)-u_double_filter_w_double_filter(i,j,k);
    L32(i,j,k)=v_filter_w_filter_tilda(i,j,k)-v_double_filter_w_double_filter(i,j,k);
    
end
end
end



for i=1:ni
for j=1:nj
for k=1:nk
Cs_numerator(i,j,k)= M11(i,j,k)*L11(i,j,k) + M12(i,j,k)*L12(i,j,k)+M13(i,j,k)*L13(i,j,k)+...
    M21(i,j,k)*L21(i,j,k)+M22(i,j,k)*L22(i,j,k)+M23(i,j,k)*L23(i,j,k)+...
    M31(i,j,k)*L31(i,j,k)+M32(i,j,k)*L32(i,j,k)+M33(i,j,k)*L33(i,j,k);
 
Cs_denominator(i,j,k)= M11(i,j,k)*M11(i,j,k) + M12(i,j,k)*M12(i,j,k)+M13(i,j,k)*M13(i,j,k)+...
    M21(i,j,k)*M21(i,j,k)+M22(i,j,k)*M22(i,j,k)+M23(i,j,k)*M23(i,j,k)+...
    M31(i,j,k)*M31(i,j,k)+M32(i,j,k)*M32(i,j,k)+M33(i,j,k)*M33(i,j,k);   
    
end
end
end

Cs_numerator_mean(1:nj)=0;
Cs_denominator_mean(1:nj)=0;
for i=1:ni
for j=1:nj
for k=1:nk
Cs_numerator_mean(j)=Cs_numerator_mean(j)+ Cs_numerator(i,j,k)/ni/nk;
Cs_denominator_mean(j)=Cs_denominator_mean(j)+ Cs_denominator(i,j,k)/ni/nk;

end
end
end




Cs_Dynamic(1:nj)=0;    

for j=1:nj
   
    
    
    Cs_Dynamic(j)=( (Cs_numerator_mean(j))/(Cs_denominator_mean(j)));
    
    
end








    
TR12_Smago_Dynamic (1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
 TR12_Smago_Dynamic (j) = TR12_Smago_Dynamic (j) -2*Cs_Dynamic(j)*((delta_bar(j))^2) *S_bar_2n(i,j,k)*S12_2n(i,j,k)/ni/nk;
 
 end
 end
 end    
    
 
 %%%% for Corelation %%%%%
 
 for k=1:nk
 for i=1:ni
 for j=1:nj
 TR12_Smago_Dynamic_space(i,j,k)= -2*Cs_Dynamic(j)*((delta_bar(j))^2) *S_bar_2n(i,j,k)*S12_2n(i,j,k);
 end
 end
 end
 
 for k=1:nk
 for i=1:ni
 for j=1:nj
 TR12_Smago_Static_2n_space(i,j,k)= -2*Cs_Static*Cs_Static*((delta_bar(j))^2) *S_bar_2n(i,j,k)*S12_2n(i,j,k);
 TR12_Smago_Static_4n_space(i,j,k)= -2*Cs_Static*Cs_Static*((delta_bar(j))^2) *S_bar_4n(i,j,k)*S12_4n(i,j,k);

 end
 end
 end
 
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
     TR12_Exact(i,j,k)=(TR_1_2n(i,j,k)+TR_2_2n(i,j,k)+TR_3_2n(i,j,k));
 
 end
 end
 end
 
 
 
 
 
 ab=TR12_Smago_Dynamic_space.*TR12_Exact;
 ac=TR12_Smago_Static_2n_space.*TR12_Exact;
  ad=TR12_Smago_Static_4n_space.*TR12_Exact;
 aa=TR12_Exact.*TR12_Exact;
 
 ab_mean(1:nj)=0;
 ad_mean(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
     ab_mean(j)= ab_mean(j)+ ab(i,j,k)/ni/nk;
     ad_mean(j)= ad_mean(j)+ ad(i,j,k)/ni/nk;
 
 end
 end
 end
 
 ac_mean(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
     ac_mean(j)= ac_mean(j)+ ac(i,j,k)/ni/nk;
 
 end
 end
 end
 
 
 aa_mean(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
     
     aa_mean(j)= aa_mean(j)+ aa(i,j,k)/ni/nk;
 
 end
 end
 end
     
    
 %M=ab_mean./aa_mean;
 %N=ac_mean./aa_mean;
 %plot(y,M);
 %hold on;
 %plot(y,N);
 %hold on;
 %xlabel('y')
 %ylabel({'Coefficient'},'Interpreter', 'LaTeX')
 %legend('Dynamic,n=2','Static,n=2')
    

  %plot(y, TR12_4n_Smago_Static);
  %hold on;   
  plot(y, TR12_2n_Smago_Static);
  hold on;   
  plot(y, TR12_Smago_Dynamic);
  hold on;
  plot(y, TR12_2n);
  hold on;
  xlabel('y')
  ylabel({'uv'},'Interpreter', 'LaTeX')
  legend({'$\langle \tau^{R}_{12} \rangle (Cs=0.05,n=2) $','$\langle \tau^{R}_{12} \rangle (Dynamic,n=2) $','$\langle \tau^{R}_{12} \rangle (Exact) $'},'Interpreter', 'LaTeX','FontSize',12)
    
 %%   
    
    
 
 %%%%%%%%%%% Part 2 Question 2 %%%%%%%%%%%
  Mu_t_Dynamic(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_Dynamic(j)=Mu_t_Dynamic(j)+(delta_bar(j))*(Cs_Dynamic(j)*delta_bar(j))*S_bar_2n(i,j,k)/ni/nk;
 end
 end
 end
 
 Mu_t_Static_2n(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_Static_2n(j)=Mu_t_Static_2n(j)+(Cs_Static*delta_bar(j))*((Cs_Static)*delta_bar(j))*S_bar_2n(i,j,k)/ni/nk;
 end
 end
 end
 
 Mu_t_Static_4n(1:nj)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_Static_4n(j)=Mu_t_Static_4n(j)+(Cs_Static*delta_tilda(j))*((Cs_Static)*delta_tilda(j))*S_bar_4n(i,j,k)/ni/nk;
 end
 end
 end
 
 Mu_t_nu_Static_2n(1:ni,1:nj,1:nk)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_nu_Static_2n(i,j,k)=Mu_t_nu_Static_2n(i,j,k)+(Cs_Static*delta_bar(j))*(Cs_Static*delta_bar(j))*S_bar_2n(i,j,k)/nu;
 end
 end
 end
 
 Mu_t_nu_Static_4n(1:ni,1:nj,1:nk)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_nu_Static_4n(i,j,k)=Mu_t_nu_Static_4n(i,j,k)+(Cs_Static*delta_tilda(j))*(Cs_Static*delta_tilda(j))*S_bar_4n(i,j,k)/nu;
 end
 end
 end
 
 Mu_t_nu_Dynamic(1:ni,1:nj,1:nk)=0;
 for k=1:nk
 for i=1:ni
 for j=1:nj
 Mu_t_nu_Dynamic(i,j,k)=Mu_t_nu_Dynamic(i,j,k)+(Cs_Dynamic(j))*delta_bar(j)*delta_bar(j)*S_bar_2n(i,j,k)/nu;
 end
 end
 end
 
 plot(y,Mu_t_Dynamic/nu);
 hold on;
 plot(y,Mu_t_Static_2n/nu);
 hold on; 
 %plot(y,Mu_t_Static_4n/nu);
 %hold on;
 xlabel('y')
 ylabel({'$ \nu_{t}/\nu  $'},'Interpreter', 'LaTeX')
 legend({'Dynamic','Static (Cs=0.05,n=2)'},'Interpreter', 'LaTeX','FontSize',12)
    
 


%x = 0:dx:95*dx;
%[Y,X] = meshgrid(y,x);
%Z = Mu_t_nu_Static_2n(1:ni,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')

%x = 0:dx:92*dx;
%[Y,X] = meshgrid(y,x);
%Z = Mu_t_nu_Static_4n(1:ni-3,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')

%x = 0:dx:95*dx;
%[Y,X] = meshgrid(y,x);
%Z = Mu_t_nu_Dynamic(1:ni,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')
 %%
 %%%%%%%%%%%%%%% Part 2 Question 3 %%%%%%%%%%%%%%
 
 
 
 
 %%%%%%%% 12 %%%%%%%%
 
 u1_v1_3d(1:ni,1:nj,1:nk)=0;
u2_v2_3d(1:ni,1:nj,1:nk)=0;
u3_v3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_v1_3d(i,j,k)= u1_v1_3d(i,j,k)+  u1_3d(i,j,k)*v1_3d(i,j,k);
    u2_v2_3d(i,j,k)= u2_v2_3d(i,j,k)+  u2_3d(i,j,k)*v2_3d(i,j,k);
    u3_v3_3d(i,j,k)= u3_v3_3d(i,j,k)+  u3_3d(i,j,k)*v3_3d(i,j,k);

end
end
end

u1_v1_filter_2n=f2(u1_v1_3d,y,dx,dz,ni,nj,nk);
u2_v2_filter_2n=f2(u2_v2_3d,y,dx,dz,ni,nj,nk);
u3_v3_filter_2n=f2(u3_v3_3d,y,dx,dz,ni,nj,nk);
u1_v1_filter_4n=f4(u1_v1_3d,y,dx,dz,ni,nj,nk);
u2_v2_filter_4n=f4(u2_v2_3d,y,dx,dz,ni,nj,nk);
u3_v3_filter_4n=f4(u3_v3_3d,y,dx,dz,ni,nj,nk);


for k=1:nk
for j=1:nj
for i=1:ni
Tr12_1_2n(i,j,k)=u1_v1_filter_2n(i,j,k) - u1_filter_2n(i,j,k)*v1_filter_2n(i,j,k);
Tr12_2_2n(i,j,k)=u2_v2_filter_2n(i,j,k) - u2_filter_2n(i,j,k)*v2_filter_2n(i,j,k);
Tr12_3_2n(i,j,k)=u3_v3_filter_2n(i,j,k) - u3_filter_2n(i,j,k)*v3_filter_2n(i,j,k);
Tr12_1_4n(i,j,k)=u1_v1_filter_4n(i,j,k) - u1_filter_4n(i,j,k)*v1_filter_4n(i,j,k);
Tr12_2_4n(i,j,k)=u2_v2_filter_4n(i,j,k) - u2_filter_4n(i,j,k)*v2_filter_4n(i,j,k);
Tr12_3_4n(i,j,k)=u3_v3_filter_4n(i,j,k) - u3_filter_4n(i,j,k)*v3_filter_4n(i,j,k);

end
end
end

Tr12_2n(1:ni,1:nj,1:nk)=0;
Tr12_4n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
    
Tr12_2n(i,j,k)=Tr12_2n(i,j,k)+((Tr12_1_2n(i,j,k)+Tr12_2_2n(i,j,k)+Tr12_3_2n(i,j,k)))/3;
Tr12_4n(i,j,k)=Tr12_4n(i,j,k)+((Tr12_1_4n(i,j,k)+Tr12_2_4n(i,j,k)+Tr12_3_4n(i,j,k)))/3;

end
end
end

 
 
 
 
 %%%% 13 %%%%%%
u1_w1_3d(1:ni,1:nj,1:nk)=0;
u2_w2_3d(1:ni,1:nj,1:nk)=0;
u3_w3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_w1_3d(i,j,k)= u1_w1_3d(i,j,k)+  u1_3d(i,j,k)*w1_3d(i,j,k);
    u2_w2_3d(i,j,k)= u2_w2_3d(i,j,k)+  u2_3d(i,j,k)*w2_3d(i,j,k);
    u3_w3_3d(i,j,k)= u3_w3_3d(i,j,k)+  u3_3d(i,j,k)*w3_3d(i,j,k);

end
end
end

u1_w1_filter_2n=f2(u1_w1_3d,y,dx,dz,ni,nj,nk);
u2_w2_filter_2n=f2(u2_w2_3d,y,dx,dz,ni,nj,nk);
u3_w3_filter_2n=f2(u3_w3_3d,y,dx,dz,ni,nj,nk);
u1_w1_filter_4n=f4(u1_w1_3d,y,dx,dz,ni,nj,nk);
u2_w2_filter_4n=f4(u2_w2_3d,y,dx,dz,ni,nj,nk);
u3_w3_filter_4n=f4(u3_w3_3d,y,dx,dz,ni,nj,nk);


for k=1:nk
for j=1:nj
for i=1:ni
Tr13_1_2n(i,j,k)=u1_w1_filter_2n(i,j,k) - u1_filter_2n(i,j,k)*w1_filter_2n(i,j,k);
Tr13_2_2n(i,j,k)=u2_w2_filter_2n(i,j,k) - u2_filter_2n(i,j,k)*w2_filter_2n(i,j,k);
Tr13_3_2n(i,j,k)=u3_w3_filter_2n(i,j,k) - u3_filter_2n(i,j,k)*w3_filter_2n(i,j,k);
Tr13_1_4n(i,j,k)=u1_w1_filter_4n(i,j,k) - u1_filter_4n(i,j,k)*w1_filter_4n(i,j,k);
Tr13_2_4n(i,j,k)=u2_w2_filter_4n(i,j,k) - u2_filter_4n(i,j,k)*w2_filter_4n(i,j,k);
Tr13_3_4n(i,j,k)=u3_w3_filter_4n(i,j,k) - u3_filter_4n(i,j,k)*w3_filter_4n(i,j,k);

end
end
end

Tr13_2n(1:ni,1:nj,1:nk)=0;
Tr13_4n(1:ni,1:nj,1:nk)=0;
for k=1:nk
for i=1:ni
for j=1:nj
Tr13_2n(i,j,k)=Tr13_2n(i,j,k)+((Tr13_1_2n(i,j,k)+Tr13_2_2n(i,j,k)+Tr13_3_2n(i,j,k)))/3;
Tr13_4n(i,j,k)=Tr13_4n(i,j,k)+((Tr13_1_4n(i,j,k)+Tr13_2_4n(i,j,k)+Tr13_3_4n(i,j,k)))/3;
end
end
end
 
 %%%%%%23%%%%%%%
 
 
v1_w1_3d(1:ni,1:nj,1:nk)=0;
v2_w2_3d(1:ni,1:nj,1:nk)=0;
v3_w3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    v1_w1_3d(i,j,k)= v1_w1_3d(i,j,k)+  v1_3d(i,j,k)*w1_3d(i,j,k);
    v2_w2_3d(i,j,k)= v2_w2_3d(i,j,k)+  v2_3d(i,j,k)*w2_3d(i,j,k);
    v3_w3_3d(i,j,k)= v3_w3_3d(i,j,k)+  v3_3d(i,j,k)*w3_3d(i,j,k);

end
end
end

v1_w1_filter_2n=f2(v1_w1_3d,y,dx,dz,ni,nj,nk);
v2_w2_filter_2n=f2(v2_w2_3d,y,dx,dz,ni,nj,nk);
v3_w3_filter_2n=f2(v3_w3_3d,y,dx,dz,ni,nj,nk);
v1_w1_filter_4n=f4(v1_w1_3d,y,dx,dz,ni,nj,nk);
v2_w2_filter_4n=f4(v2_w2_3d,y,dx,dz,ni,nj,nk);
v3_w3_filter_4n=f4(v3_w3_3d,y,dx,dz,ni,nj,nk);


for k=1:nk
for j=1:nj
for i=1:ni
Tr23_1_2n(i,j,k)=v1_w1_filter_2n(i,j,k) - v1_filter_2n(i,j,k)*w1_filter_2n(i,j,k);
Tr23_2_2n(i,j,k)=v2_w2_filter_2n(i,j,k) - v2_filter_2n(i,j,k)*w2_filter_2n(i,j,k);
Tr23_3_2n(i,j,k)=v3_w3_filter_2n(i,j,k) - v3_filter_2n(i,j,k)*w3_filter_2n(i,j,k);
Tr23_1_4n(i,j,k)=v1_w1_filter_4n(i,j,k) - v1_filter_4n(i,j,k)*w1_filter_4n(i,j,k);
Tr23_2_4n(i,j,k)=v2_w2_filter_4n(i,j,k) - v2_filter_4n(i,j,k)*w2_filter_4n(i,j,k);
Tr23_3_4n(i,j,k)=v3_w3_filter_4n(i,j,k) - v3_filter_4n(i,j,k)*w3_filter_4n(i,j,k);

end
end
end

Tr23_2n(1:ni,1:nj,1:nk)=0;
Tr23_4n(1:ni,1:nj,1:nk)=0;
for k=1:nk
for i=1:ni
for j=1:nj
Tr23_2n(i,j,k)=Tr23_2n(i,j,k)+((Tr23_1_2n(i,j,k)+Tr23_2_2n(i,j,k)+Tr23_3_2n(i,j,k)))/3;
Tr23_4n(i,j,k)=Tr23_4n(i,j,k)+((Tr23_1_4n(i,j,k)+Tr23_2_4n(i,j,k)+Tr23_3_4n(i,j,k)))/3;
end
end
end
 

%%%%%%%% others %%%%%%%%

for k=1:nk
for i=1:ni
for j=1:nj
Tr21_2n(i,j,k)=Tr12_2n(i,j,k);
Tr31_2n(i,j,k)=Tr13_2n(i,j,k);
Tr32_2n(i,j,k)=Tr23_2n(i,j,k);
Tr21_4n(i,j,k)=Tr12_4n(i,j,k);
Tr31_4n(i,j,k)=Tr13_4n(i,j,k);
Tr32_4n(i,j,k)=Tr23_4n(i,j,k);
end
end
end







 
 %%%%%%11%%%%%%%

u1_u1_3d(1:ni,1:nj,1:nk)=0;
u2_u2_3d(1:ni,1:nj,1:nk)=0;
u3_u3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    u1_u1_3d(i,j,k)= u1_u1_3d(i,j,k)+  u1_3d(i,j,k)*u1_3d(i,j,k);
    u2_u2_3d(i,j,k)= u2_u2_3d(i,j,k)+  u2_3d(i,j,k)*u2_3d(i,j,k);
    u3_u3_3d(i,j,k)= u3_u3_3d(i,j,k)+  u3_3d(i,j,k)*u3_3d(i,j,k);

end
end
end

u1_u1_filter_2n=f2(u1_u1_3d,y,dx,dz,ni,nj,nk);
u2_u2_filter_2n=f2(u2_u2_3d,y,dx,dz,ni,nj,nk);
u3_u3_filter_2n=f2(u3_u3_3d,y,dx,dz,ni,nj,nk);
u1_u1_filter_4n=f4(u1_u1_3d,y,dx,dz,ni,nj,nk);
u2_u2_filter_4n=f4(u2_u2_3d,y,dx,dz,ni,nj,nk);
u3_u3_filter_4n=f4(u3_u3_3d,y,dx,dz,ni,nj,nk);

for k=1:nk
for j=1:nj
for i=1:ni
TR11_1_2n(i,j,k)=u1_u1_filter_2n(i,j,k) - u1_filter_2n(i,j,k)*u1_filter_2n(i,j,k);
TR11_2_2n(i,j,k)=u2_u2_filter_2n(i,j,k) - u2_filter_2n(i,j,k)*u2_filter_2n(i,j,k);
TR11_3_2n(i,j,k)=u3_u3_filter_2n(i,j,k) - u3_filter_2n(i,j,k)*u3_filter_2n(i,j,k);
TR11_1_4n(i,j,k)=u1_u1_filter_4n(i,j,k) - u1_filter_4n(i,j,k)*u1_filter_4n(i,j,k);
TR11_2_4n(i,j,k)=u2_u2_filter_4n(i,j,k) - u2_filter_4n(i,j,k)*u2_filter_4n(i,j,k);
TR11_3_4n(i,j,k)=u3_u3_filter_4n(i,j,k) - u3_filter_4n(i,j,k)*u3_filter_4n(i,j,k);

end
end
end

TR11_2n(1:ni,1:nj,1:nk)=0;
TR11_4n(1:ni,1:nj,1:nk)=0;
for k=1:nk
for i=1:ni
for j=1:nj
TR11_2n(i,j,k)=TR11_2n(i,j,k)+((TR11_1_2n(i,j,k)+TR11_2_2n(i,j,k)+TR11_3_2n(i,j,k)))/3;
TR11_4n(i,j,k)=TR11_4n(i,j,k)+((TR11_1_4n(i,j,k)+TR11_2_4n(i,j,k)+TR11_3_4n(i,j,k)))/3;

end
end
end

%%%%22%%%%%


v1_v1_3d(1:ni,1:nj,1:nk)=0;
v2_v2_3d(1:ni,1:nj,1:nk)=0;
v3_v3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    v1_v1_3d(i,j,k)= v1_v1_3d(i,j,k)+  v1_3d(i,j,k)*v1_3d(i,j,k);
    v2_v2_3d(i,j,k)= v2_v2_3d(i,j,k)+  v2_3d(i,j,k)*v2_3d(i,j,k);
    v3_v3_3d(i,j,k)= v3_v3_3d(i,j,k)+  v3_3d(i,j,k)*v3_3d(i,j,k);

end
end
end

v1_v1_filter_2n=f2(v1_v1_3d,y,dx,dz,ni,nj,nk);
v2_v2_filter_2n=f2(v2_v2_3d,y,dx,dz,ni,nj,nk);
v3_v3_filter_2n=f2(v3_v3_3d,y,dx,dz,ni,nj,nk);
v1_v1_filter_4n=f4(v1_v1_3d,y,dx,dz,ni,nj,nk);
v2_v2_filter_4n=f4(v2_v2_3d,y,dx,dz,ni,nj,nk);
v3_v3_filter_4n=f4(v3_v3_3d,y,dx,dz,ni,nj,nk);



for k=1:nk
for j=1:nj
for i=1:ni
TR22_1_2n(i,j,k)=v1_v1_filter_2n(i,j,k) - v1_filter_2n(i,j,k)*v1_filter_2n(i,j,k);
TR22_2_2n(i,j,k)=v2_v2_filter_2n(i,j,k) - v2_filter_2n(i,j,k)*v2_filter_2n(i,j,k);
TR22_3_2n(i,j,k)=v3_v3_filter_2n(i,j,k) - v3_filter_2n(i,j,k)*v3_filter_2n(i,j,k);
TR22_1_4n(i,j,k)=v1_v1_filter_4n(i,j,k) - v1_filter_4n(i,j,k)*v1_filter_4n(i,j,k);
TR22_2_4n(i,j,k)=v2_v2_filter_4n(i,j,k) - v2_filter_4n(i,j,k)*v2_filter_4n(i,j,k);
TR22_3_4n(i,j,k)=v3_v3_filter_4n(i,j,k) - v3_filter_4n(i,j,k)*v3_filter_4n(i,j,k);
end
end
end

TR22_2n(1:ni,1:nj,1:nk)=0;
TR22_4n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
TR22_2n(i,j,k)=TR22_2n(i,j,k)+((TR22_1_2n(i,j,k)+TR22_2_2n(i,j,k)+TR22_3_2n(i,j,k)))/3;
TR22_4n(i,j,k)=TR22_4n(i,j,k)+((TR22_1_4n(i,j,k)+TR22_2_4n(i,j,k)+TR22_3_4n(i,j,k)))/3;

end
end
end
 
 
 %%%%% 33 %%%%%%


w1_w1_3d(1:ni,1:nj,1:nk)=0;
w2_w2_3d(1:ni,1:nj,1:nk)=0;
w3_w3_3d(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj
for k=1:nk
    
    w1_w1_3d(i,j,k)= w1_w1_3d(i,j,k)+  w1_3d(i,j,k)*w1_3d(i,j,k);
    w2_w2_3d(i,j,k)= w2_w2_3d(i,j,k)+  w2_3d(i,j,k)*w2_3d(i,j,k);
    w3_w3_3d(i,j,k)= w3_w3_3d(i,j,k)+  w3_3d(i,j,k)*w3_3d(i,j,k);

end
end
end

w1_w1_filter_2n=f2(w1_w1_3d,y,dx,dz,ni,nj,nk);
w2_w2_filter_2n=f2(w2_w2_3d,y,dx,dz,ni,nj,nk);
w3_w3_filter_2n=f2(w3_w3_3d,y,dx,dz,ni,nj,nk);
w1_w1_filter_4n=f4(w1_w1_3d,y,dx,dz,ni,nj,nk);
w2_w2_filter_4n=f4(w2_w2_3d,y,dx,dz,ni,nj,nk);
w3_w3_filter_4n=f4(w3_w3_3d,y,dx,dz,ni,nj,nk);



for k=1:nk
for j=1:nj
for i=1:ni
TR33_1_2n(i,j,k)=w1_w1_filter_2n(i,j,k) - w1_filter_2n(i,j,k)*w1_filter_2n(i,j,k);
TR33_2_2n(i,j,k)=w2_w2_filter_2n(i,j,k) - w2_filter_2n(i,j,k)*w2_filter_2n(i,j,k);
TR33_3_2n(i,j,k)=w3_w3_filter_2n(i,j,k) - w3_filter_2n(i,j,k)*w3_filter_2n(i,j,k);
TR33_1_4n(i,j,k)=w1_w1_filter_4n(i,j,k) - w1_filter_4n(i,j,k)*w1_filter_4n(i,j,k);
TR33_2_4n(i,j,k)=w2_w2_filter_4n(i,j,k) - w2_filter_4n(i,j,k)*w2_filter_4n(i,j,k);
TR33_3_4n(i,j,k)=w3_w3_filter_4n(i,j,k) - w3_filter_4n(i,j,k)*w3_filter_4n(i,j,k);

end
end
end

TR33_2n(1:ni,1:nj,1:nk)=0;
TR33_4n(1:ni,1:nj,1:nk)=0;

for k=1:nk
for i=1:ni
for j=1:nj
TR33_2n(i,j,k)=TR33_2n(i,j,k)+((TR33_1_2n(i,j,k)+TR33_2_2n(i,j,k)+TR33_3_2n(i,j,k)))/3;
TR33_4n(i,j,k)=TR33_4n(i,j,k)+((TR33_1_4n(i,j,k)+TR33_2_4n(i,j,k)+TR33_3_4n(i,j,k)))/3;

end
end
end



 
%%%%% diagonal components %%%%%%%

for k=1:nk
for i=1:ni
for j=1:nj
    
    TRkk_2n(i,j,k)= (TR11_2n(i,j,k)+TR22_2n(i,j,k)+TR33_2n(i,j,k))/3 ;
    TRkk_4n(i,j,k)= (TR11_4n(i,j,k)+TR22_4n(i,j,k)+TR33_4n(i,j,k))/3 ;
 
end
end
end


for k=1:nk
for i=1:ni
for j=1:nj
    
    Tr11_2n(i,j,k)= TR11_2n(i,j,k) - TRkk_2n(i,j,k) ;
    Tr22_2n(i,j,k)= TR22_2n(i,j,k) - TRkk_2n(i,j,k) ;
    Tr33_2n(i,j,k)= TR33_2n(i,j,k) - TRkk_2n(i,j,k) ;
    Tr11_4n(i,j,k)= TR11_4n(i,j,k) - TRkk_4n(i,j,k) ;
    Tr22_4n(i,j,k)= TR22_4n(i,j,k) - TRkk_4n(i,j,k) ;
    Tr33_4n(i,j,k)= TR33_4n(i,j,k) - TRkk_4n(i,j,k) ;
 
end
end
end


%%%%%%%% Production %%%%%%%%


for k=1:nk
for i=1:ni
for j=1:nj
    
    Production_exact_2n (i,j,k) = -1*(Tr11_2n(i,j,k)*S11_2n(i,j,k)+Tr21_2n(i,j,k)*S21_2n(i,j,k)+...
        Tr31_2n(i,j,k)*S31_2n(i,j,k)+ Tr12_2n(i,j,k)*S12_2n(i,j,k)+Tr22_2n(i,j,k)*S22_2n(i,j,k)+...
        Tr32_2n(i,j,k)*S32_2n(i,j,k)+Tr13_2n(i,j,k)*S13_2n(i,j,k)+Tr23_2n(i,j,k)*S23_2n(i,j,k)+...
        Tr33_2n(i,j,k)*S33_2n(i,j,k));

end
end
end

for k=1:nk
for i=1:ni
for j=1:nj
    
    Production_exact_4n (i,j,k) = -1*(Tr11_4n(i,j,k)*S11_4n(i,j,k)+Tr21_4n(i,j,k)*S21_4n(i,j,k)+...
        Tr31_4n(i,j,k)*S31_4n(i,j,k)+ Tr12_4n(i,j,k)*S12_4n(i,j,k)+Tr22_4n(i,j,k)*S22_4n(i,j,k)+...
        Tr32_4n(i,j,k)*S32_4n(i,j,k)+Tr13_4n(i,j,k)*S13_4n(i,j,k)+Tr23_4n(i,j,k)*S23_4n(i,j,k)+...
        Tr33_4n(i,j,k)*S33_4n(i,j,k));

end
end
end

for k=1:nk
for i=1:ni
for j=1:nj
Tr11_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S11_2n(i,j,k);
Tr12_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S12_2n(i,j,k);
Tr13_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S13_2n(i,j,k);
Tr21_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S21_2n(i,j,k);
Tr22_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S22_2n(i,j,k);
Tr23_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S23_2n(i,j,k);
Tr31_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S31_2n(i,j,k);
Tr32_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S32_2n(i,j,k);
Tr33_model_Dynamic(i,j,k)= -2*Cs_Dynamic(j)*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S33_2n(i,j,k);
end
end
end


for k=1:nk
for i=1:ni
for j=1:nj
    
    Production_model_Dynamic (i,j,k) = -1*(Tr11_model_Dynamic(i,j,k)*S11_2n(i,j,k)+Tr21_model_Dynamic(i,j,k)*S21_2n(i,j,k)+...
        Tr31_model_Dynamic(i,j,k)*S31_2n(i,j,k)+Tr12_model_Dynamic(i,j,k)*S12_2n(i,j,k)+Tr22_model_Dynamic(i,j,k)*S22_2n(i,j,k)+...
        Tr32_model_Dynamic(i,j,k)*S32_2n(i,j,k)+Tr13_model_Dynamic(i,j,k)*S13_2n(i,j,k)+Tr23_model_Dynamic(i,j,k)*S23_2n(i,j,k)+...
        Tr33_model_Dynamic(i,j,k)*S33_2n(i,j,k));

end
end
end

for k=1:nk
for i=1:ni
for j=1:nj
Tr11_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S11_2n(i,j,k);
Tr12_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S12_2n(i,j,k);
Tr13_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S13_2n(i,j,k);
Tr21_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S21_2n(i,j,k);
Tr22_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S22_2n(i,j,k);
Tr23_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S23_2n(i,j,k);
Tr31_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S31_2n(i,j,k);
Tr32_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S32_2n(i,j,k);
Tr33_model_Static_2n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_bar(j))*(delta_bar(j))*S_bar_2n(i,j,k)*S33_2n(i,j,k);
end
end
end


for k=1:nk
for i=1:ni
for j=1:nj
Tr11_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S11_4n(i,j,k);
Tr12_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S12_4n(i,j,k);
Tr13_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S13_4n(i,j,k);
Tr21_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S21_4n(i,j,k);
Tr22_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S22_4n(i,j,k);
Tr23_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S23_4n(i,j,k);
Tr31_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S31_4n(i,j,k);
Tr32_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S32_4n(i,j,k);
Tr33_model_Static_4n(i,j,k)= -2*Cs_Static*Cs_Static*(delta_tilda(j))*(delta_tilda(j))*S_bar_4n(i,j,k)*S33_4n(i,j,k);
end
end
end


for k=1:nk
for i=1:ni
for j=1:nj
    
    Production_model_Static_2n (i,j,k) = -1*(Tr11_model_Static_2n(i,j,k)*S11_2n(i,j,k)+Tr21_model_Static_2n(i,j,k)*S21_2n(i,j,k)+...
        Tr31_model_Static_2n(i,j,k)*S31_2n(i,j,k)+Tr12_model_Static_2n(i,j,k)*S12_2n(i,j,k)+Tr22_model_Static_2n(i,j,k)*S22_2n(i,j,k)+...
        Tr32_model_Static_2n(i,j,k)*S32_2n(i,j,k)+Tr13_model_Static_2n(i,j,k)*S13_2n(i,j,k)+Tr23_model_Static_2n(i,j,k)*S23_2n(i,j,k)+...
        Tr33_model_Static_2n(i,j,k)*S33_2n(i,j,k));
    
     Production_model_Static_4n (i,j,k) = -1*(Tr11_model_Static_4n(i,j,k)*S11_4n(i,j,k)+Tr21_model_Static_4n(i,j,k)*S21_4n(i,j,k)+...
        Tr31_model_Static_4n(i,j,k)*S31_4n(i,j,k)+Tr12_model_Static_4n(i,j,k)*S12_4n(i,j,k)+Tr22_model_Static_4n(i,j,k)*S22_4n(i,j,k)+...
        Tr32_model_Static_4n(i,j,k)*S32_4n(i,j,k)+Tr13_model_Static_4n(i,j,k)*S13_4n(i,j,k)+Tr23_model_Static_4n(i,j,k)*S23_4n(i,j,k)+...
        Tr33_model_Static_4n(i,j,k)*S33_4n(i,j,k));

end
end
end



%x = 0:dx:95*dx;
%[Y,X] = meshgrid(y,x);
%Z = Production_model_Dynamic (1:ni,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')

%x = 0:dx:95*dx;
%[Y,X] = meshgrid(y,x);
%Z = Production_exact_2n (1:ni,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')

%x = 0:dx:95*dx;
%[Y,X] = meshgrid(y,x);
%Z = Production_model_Static_2n (1:ni,1:nj,nk/2);
%contourf(X,Y,Z,20);
%xlabel('x')
%ylabel('y')

x = 0:dx:95*dx;
[Y,X] = meshgrid(y,x);
Z = Production_model_Static_4n (1:ni,1:nj,nk/2);
contourf(X,Y,Z,20);
xlabel('x')
ylabel('y')

%%
%%%%%%%%%% Part 2 Question 4 %%%%%%%%%%%%%

Production_model_Static_mean (1:nj)=0;
Production_model_Dynamic_mean (1:nj)=0;
Production_exact_mean_2n (1:nj)=0;
Production_exact_mean_4n (1:nj)=0;

for k=1:nk
for i=1:ni
for j=1:nj
    Production_model_Static_mean(j) = Production_model_Static_mean(j)+ Production_model_Static_2n(i,j,k)/ni/nk;
    Production_model_Dynamic_mean(j) = Production_model_Dynamic_mean(j)+ Production_model_Dynamic(i,j,k)/ni/nk;
    Production_exact_mean_2n(j) = Production_exact_mean_2n(j)+ Production_exact_2n(i,j,k)/ni/nk;
    Production_exact_mean_4n(j) = Production_exact_mean_4n(j)+ Production_exact_4n(i,j,k)/ni/nk;

end
end
end

plot(y,Production_model_Static_mean);
hold on;
plot(y,Production_model_Dynamic_mean);
hold on;
plot(y,Production_exact_mean_2n);
hold on;
xlabel('y')
ylabel({'Production'},'Interpreter', 'LaTeX')
legend({'$\langle P^{Static}_{r} \rangle $','$\langle P^{Dynamic}_{r} \rangle $','$\langle P_{r}(n=2) \rangle $','$\langle P_{r}(n=4) \rangle $'},'Interpreter', 'LaTeX','FontSize',12)

%%
%%%%%%%%%%%% Part 2 Question 5 %%%%%%%%%%%%



for k=1:nk
for i=1:ni
for j=1:nj
    
    epsilon_f_2n(i,j,k)= 2*nu*( S11_2n(i,j,k)*S11_2n(i,j,k) + S12_2n(i,j,k)*S12_2n(i,j,k)+...
    S13_2n(i,j,k)*S13_2n(i,j,k)+S21_2n(i,j,k)*S21_2n(i,j,k)+S22_2n(i,j,k)*S22_2n(i,j,k)+...
    S23_2n(i,j,k)*S23_2n(i,j,k)+S31_2n(i,j,k)*S31_2n(i,j,k)+S32_2n(i,j,k)*S32_2n(i,j,k)+...
    S33_2n(i,j,k)*S33_2n(i,j,k));
end
end
end

for k=1:nk
for i=1:ni
for j=1:nj
    
    epsilon_f_4n(i,j,k)= 2*nu*( S11_4n(i,j,k)*S11_4n(i,j,k) + S12_4n(i,j,k)*S12_4n(i,j,k)+...
    S13_4n(i,j,k)*S13_4n(i,j,k)+S21_4n(i,j,k)*S21_4n(i,j,k)+S22_4n(i,j,k)*S22_4n(i,j,k)+...
    S23_4n(i,j,k)*S23_4n(i,j,k)+S31_4n(i,j,k)*S31_4n(i,j,k)+S32_4n(i,j,k)*S32_4n(i,j,k)+...
    S33_4n(i,j,k)*S33_4n(i,j,k));
end
end
end



%%%%%% gradiendts %%%%%%%%


%%%%%%%%% first u_y %%%%%%%%%%5





u1_grad_y(1:ni,1:nj,1:nk)=0;
u2_grad_y(1:ni,1:nj,1:nk)=0;
u3_grad_y(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj-1
for k=1:nk
  
u1_grad_y(i,j,k) = u1_grad_y(i,j,k)+ (u1_3d(i,j+1,k)-u1_3d(i,j,k))/(y(j+1)-y(j));
u2_grad_y(i,j,k) = u2_grad_y(i,j,k)+ (u2_3d(i,j+1,k)-u2_3d(i,j,k))/(y(j+1)-y(j));
u3_grad_y(i,j,k) = u3_grad_y(i,j,k)+ (u3_3d(i,j+1,k)-u3_3d(i,j,k))/(y(j+1)-y(j));

end
end
end

for i=1:ni
for j=nj
for k=1:nk
    
u1_grad_y(i,j,k) = 0;
u2_grad_y(i,j,k) = 0;
u3_grad_y(i,j,k) = 0;

end
end
end





%%%%%%%% u_x %%%%%%%%%

u1_grad_x(1:ni,1:nj,1:nk)=0;
u2_grad_x(1:ni,1:nj,1:nk)=0;
u3_grad_x(1:ni,1:nj,1:nk)=0;



for i=1:ni-1
for j=1:nj
for k=1:nk
    
u1_grad_x(i,j,k) = u1_grad_x(i,j,k)+ (u1_3d(i+1,j,k)-u1_3d(i,j,k))/(dx);
u2_grad_x(i,j,k) = u2_grad_x(i,j,k)+ (u2_3d(i+1,j,k)-u2_3d(i,j,k))/(dx);
u3_grad_x(i,j,k) = u3_grad_x(i,j,k)+ (u3_3d(i+1,j,k)-u3_3d(i,j,k))/(dx);    


end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
u1_grad_x(i,j,k) = u1_grad_x(i-1,j,k);
u2_grad_x(i,j,k) = u1_grad_x(i-1,j,k);
u3_grad_x(i,j,k) = u1_grad_x(i-1,j,k);

end
end
end




%%%%%%%%%% u-z %%%%%%%%%


u1_grad_z(1:ni,1:nj,1:nk)=0;
u2_grad_z(1:ni,1:nj,1:nk)=0;
u3_grad_z(1:ni,1:nj,1:nk)=0;



for i=1:ni
for j=1:nj
for k=1:nk-1
    
u1_grad_z(i,j,k) = u1_grad_z(i,j,k)+ (u1_3d(i,j,k+1)-u1_3d(i,j,k))/(dz);
u2_grad_z(i,j,k) = u2_grad_z(i,j,k)+ (u2_3d(i,j,k+1)-u2_3d(i,j,k))/(dz);
u3_grad_z(i,j,k) = u3_grad_z(i,j,k)+ (u3_3d(i,j,k+1)-u3_3d(i,j,k))/(dz);    


end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
u1_grad_z(i,j,k) = u1_grad_z(i,j,k-1);
u2_grad_z(i,j,k) = u1_grad_z(i,j,k-1);
u3_grad_z(i,j,k) = u1_grad_z(i,j,k-1);

end
end
end




%%%%%%%%%%% v_x %%%%%%%%%%%%


v1_grad_x(1:ni,1:nj,1:nk)=0;
v2_grad_x(1:ni,1:nj,1:nk)=0;
v3_grad_x(1:ni,1:nj,1:nk)=0;



for i=1:ni-1
for j=1:nj
for k=1:nk
    
v1_grad_x(i,j,k) = v1_grad_x(i,j,k)+ (v1_3d(i+1,j,k)-v1_3d(i,j,k))/(dx);
v2_grad_x(i,j,k) = v2_grad_x(i,j,k)+ (v2_3d(i+1,j,k)-v2_3d(i,j,k))/(dx);
v3_grad_x(i,j,k) = v3_grad_x(i,j,k)+ (v3_3d(i+1,j,k)-v3_3d(i,j,k))/(dx);    


end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
v1_grad_x(i,j,k) = v1_grad_x(i-1,j,k);
v2_grad_x(i,j,k) = v1_grad_x(i-1,j,k);
v3_grad_x(i,j,k) = v1_grad_x(i-1,j,k);

end
end
end



%%%%%%%%% v_y %%%%%%%%%

v1_grad_y(1:ni,1:nj,1:nk)=0;
v2_grad_y(1:ni,1:nj,1:nk)=0;
v3_grad_y(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj-1
for k=1:nk
  
v1_grad_y(i,j,k) = v1_grad_y(i,j,k)+ (v1_3d(i,j+1,k)-v1_3d(i,j,k))/(y(j+1)-y(j));
v2_grad_y(i,j,k) = v2_grad_y(i,j,k)+ (v2_3d(i,j+1,k)-v2_3d(i,j,k))/(y(j+1)-y(j));
v3_grad_y(i,j,k) = v3_grad_y(i,j,k)+ (v3_3d(i,j+1,k)-v3_3d(i,j,k))/(y(j+1)-y(j));

end
end
end

for i=1:ni
for j=nj
for k=1:nk
    
v1_grad_y(i,j,k) = 0;
v2_grad_y(i,j,k) = 0;
v3_grad_y(i,j,k) = 0;

end
end
end




%%%%%%%%%%%%  v-z %%%%%%%%%%%%%%%

v1_grad_z(1:ni,1:nj,1:nk)=0;
v2_grad_z(1:ni,1:nj,1:nk)=0;
v3_grad_z(1:ni,1:nj,1:nk)=0;



for i=1:ni
for j=1:nj
for k=1:nk-1
    
v1_grad_z(i,j,k) = v1_grad_z(i,j,k)+ (v1_3d(i,j,k+1)-v1_3d(i,j,k))/(dz);
v2_grad_z(i,j,k) = v2_grad_z(i,j,k)+ (v2_3d(i,j,k+1)-v2_3d(i,j,k))/(dz);
v3_grad_z(i,j,k) = v3_grad_z(i,j,k)+ (v3_3d(i,j,k+1)-v3_3d(i,j,k))/(dz);    


end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
v1_grad_z(i,j,k) = v1_grad_z(i,j,k-1);
v2_grad_z(i,j,k) = v1_grad_z(i,j,k-1);
v3_grad_z(i,j,k) = v1_grad_z(i,j,k-1);

end
end
end




%%%%%%%%%%%%%% w-x %%%%%%%%%%%%%%

w1_grad_x(1:ni,1:nj,1:nk)=0;
w2_grad_x(1:ni,1:nj,1:nk)=0;
w3_grad_x(1:ni,1:nj,1:nk)=0;



for i=1:ni-1
for j=1:nj
for k=1:nk
    
w1_grad_x(i,j,k) = w1_grad_x(i,j,k)+ (w1_3d(i+1,j,k)-w1_3d(i,j,k))/(dx);
w2_grad_x(i,j,k) = w2_grad_x(i,j,k)+ (w2_3d(i+1,j,k)-w2_3d(i,j,k))/(dx);
w3_grad_x(i,j,k) = w3_grad_x(i,j,k)+ (w3_3d(i+1,j,k)-w3_3d(i,j,k))/(dx);    


end
end
end



for i=ni
for j=1:nj
for k=1:nk
    
w1_grad_x(i,j,k) = w1_grad_x(i-1,j,k);
w2_grad_x(i,j,k) = w1_grad_x(i-1,j,k);
w3_grad_x(i,j,k) = w1_grad_x(i-1,j,k);

end
end
end




%%%%%%%%%%%%%% w_y %%%%%%%%%%%%%%

w1_grad_y(1:ni,1:nj,1:nk)=0;
w2_grad_y(1:ni,1:nj,1:nk)=0;
w3_grad_y(1:ni,1:nj,1:nk)=0;

for i=1:ni
for j=1:nj-1
for k=1:nk
  
w1_grad_y(i,j,k) = w1_grad_y(i,j,k)+ (w1_3d(i,j+1,k)-w1_3d(i,j,k))/(y(j+1)-y(j));
w2_grad_y(i,j,k) = w2_grad_y(i,j,k)+ (w2_3d(i,j+1,k)-w2_3d(i,j,k))/(y(j+1)-y(j));
w3_grad_y(i,j,k) = w3_grad_y(i,j,k)+ (w3_3d(i,j+1,k)-w3_3d(i,j,k))/(y(j+1)-y(j));

end
end
end

for i=1:ni
for j=nj
for k=1:nk
    
w1_grad_y(i,j,k) = 0;
w2_grad_y(i,j,k) = 0;
w3_grad_y(i,j,k) = 0;

end
end
end




%%%%%%%%%%%% w_z %%%%%%%%%%

w1_grad_z(1:ni,1:nj,1:nk)=0;
w2_grad_z(1:ni,1:nj,1:nk)=0;
w3_grad_z(1:ni,1:nj,1:nk)=0;



for i=1:ni
for j=1:nj
for k=1:nk-1
    
w1_grad_z(i,j,k) = w1_grad_z(i,j,k)+ (w1_3d(i,j,k+1)-w1_3d(i,j,k))/(dz);
w2_grad_z(i,j,k) = w2_grad_z(i,j,k)+ (w2_3d(i,j,k+1)-w2_3d(i,j,k))/(dz);
w3_grad_z(i,j,k) = w3_grad_z(i,j,k)+ (w3_3d(i,j,k+1)-w3_3d(i,j,k))/(dz);    


end
end
end



for i=1:ni
for j=1:nj
for k=nk
    
w1_grad_z(i,j,k) = w1_grad_z(i,j,k-1);
w2_grad_z(i,j,k) = w1_grad_z(i,j,k-1);
w3_grad_z(i,j,k) = w1_grad_z(i,j,k-1);

end
end
end


for i=1:ni
for j=1:nj
for k=1:nk
    Er_b(i,j,k)= (u1_grad_x(i,j,k)*u1_grad_x(i,j,k)+u2_grad_x(i,j,k)*u2_grad_x(i,j,k)+u3_grad_x(i,j,k)*u3_grad_x(i,j,k)+...
        v1_grad_x(i,j,k)*v1_grad_x(i,j,k)+v2_grad_x(i,j,k)*v2_grad_x(i,j,k)+v3_grad_x(i,j,k)*v3_grad_x(i,j,k)+...
        w1_grad_x(i,j,k)*w1_grad_x(i,j,k)+ w2_grad_x(i,j,k)*w2_grad_x(i,j,k)+w3_grad_x(i,j,k)*w3_grad_x(i,j,k)+...
        u1_grad_y(i,j,k)*u1_grad_y(i,j,k)+ u2_grad_y(i,j,k)*u2_grad_y(i,j,k)+u3_grad_y(i,j,k)*u3_grad_y(i,j,k)+...
        v1_grad_y(i,j,k)*v1_grad_y(i,j,k)+v2_grad_y(i,j,k)*v2_grad_y(i,j,k)+v3_grad_y(i,j,k)*v3_grad_y(i,j,k)+...
        w1_grad_y(i,j,k)*w1_grad_y(i,j,k)+w2_grad_y(i,j,k)*w2_grad_y(i,j,k)+w3_grad_y(i,j,k)*w3_grad_y(i,j,k)+...
        u1_grad_z(i,j,k)*u1_grad_z(i,j,k)+u2_grad_z(i,j,k)*u2_grad_z(i,j,k)+u3_grad_z(i,j,k)*u3_grad_z(i,j,k)+...
        v1_grad_z(i,j,k)*v1_grad_z(i,j,k)+v2_grad_z(i,j,k)*v2_grad_z(i,j,k)+v3_grad_z(i,j,k)*v3_grad_z(i,j,k)+...
        w1_grad_z(i,j,k)*w1_grad_z(i,j,k)+w2_grad_z(i,j,k)*w2_grad_z(i,j,k)+w3_grad_z(i,j,k)*w3_grad_z(i,j,k))/3;
        
end
end
end

Er_b_filter_2n = f2(Er_b,y,dx,dz,ni,nj,nk);
Er_b_filter_4n = f4(Er_b,y,dx,dz,ni,nj,nk);

for i=1:ni
for j=1:nj
for k=1:nk
    Er_a_2n(i,j,k)= (u1filter2n_grad_x(i,j,k)*u1filter2n_grad_x(i,j,k)+u2filter2n_grad_x(i,j,k)*u2filter2n_grad_x(i,j,k)+u3filter2n_grad_x(i,j,k)*u3filter2n_grad_x(i,j,k)+...
v1filter2n_grad_x(i,j,k)*v1filter2n_grad_x(i,j,k)+v2filter2n_grad_x(i,j,k)*v2filter2n_grad_x(i,j,k)+v3filter2n_grad_x(i,j,k)*v3filter2n_grad_x(i,j,k)+...
w1filter2n_grad_x(i,j,k)*w1filter2n_grad_x(i,j,k)+w2filter2n_grad_x(i,j,k)*w2filter2n_grad_x(i,j,k)+w3filter2n_grad_x(i,j,k)*w3filter2n_grad_x(i,j,k)+...
u1filter2n_grad_y(i,j,k)*u1filter2n_grad_y(i,j,k)+u2filter2n_grad_y(i,j,k)*u2filter2n_grad_y(i,j,k)+u3filter2n_grad_y(i,j,k)*u3filter2n_grad_y(i,j,k)+...
v1filter2n_grad_y(i,j,k)*v1filter2n_grad_y(i,j,k)+v2filter2n_grad_y(i,j,k)*v2filter2n_grad_y(i,j,k)+v3filter2n_grad_y(i,j,k)*v3filter2n_grad_y(i,j,k)+...
w1filter2n_grad_y(i,j,k)*w1filter2n_grad_y(i,j,k)+w2filter2n_grad_y(i,j,k)*w2filter2n_grad_y(i,j,k)+w3filter2n_grad_y(i,j,k)*w3filter2n_grad_y(i,j,k)+...
u1filter2n_grad_z(i,j,k)*u1filter2n_grad_z(i,j,k)+u2filter2n_grad_z(i,j,k)*u2filter2n_grad_z(i,j,k)+u3filter2n_grad_z(i,j,k)*u3filter2n_grad_z(i,j,k)+...
v1filter2n_grad_z(i,j,k)*v1filter2n_grad_z(i,j,k)+v2filter2n_grad_z(i,j,k)*v2filter2n_grad_z(i,j,k)+v3filter2n_grad_z(i,j,k)*v3filter2n_grad_z(i,j,k)+...
w1filter2n_grad_z(i,j,k)*w1filter2n_grad_z(i,j,k)+w2filter2n_grad_z(i,j,k)*w2filter2n_grad_z(i,j,k)+w3filter2n_grad_z(i,j,k)*w3filter2n_grad_z(i,j,k))/3;
end
end
end

for i=1:ni
for j=1:nj
for k=1:nk
    Er_a_4n(i,j,k)= (u1filter4n_grad_x(i,j,k)*u1filter4n_grad_x(i,j,k)+u2filter4n_grad_x(i,j,k)*u2filter4n_grad_x(i,j,k)+u3filter4n_grad_x(i,j,k)*u3filter4n_grad_x(i,j,k)+...
v1filter4n_grad_x(i,j,k)*v1filter4n_grad_x(i,j,k)+v2filter4n_grad_x(i,j,k)*v2filter4n_grad_x(i,j,k)+v3filter4n_grad_x(i,j,k)*v3filter4n_grad_x(i,j,k)+...
w1filter4n_grad_x(i,j,k)*w1filter4n_grad_x(i,j,k)+w2filter4n_grad_x(i,j,k)*w2filter4n_grad_x(i,j,k)+w3filter4n_grad_x(i,j,k)*w3filter4n_grad_x(i,j,k)+...
u1filter4n_grad_y(i,j,k)*u1filter4n_grad_y(i,j,k)+u2filter4n_grad_y(i,j,k)*u2filter4n_grad_y(i,j,k)+u3filter4n_grad_y(i,j,k)*u3filter4n_grad_y(i,j,k)+...
v1filter4n_grad_y(i,j,k)*v1filter4n_grad_y(i,j,k)+v2filter4n_grad_y(i,j,k)*v2filter4n_grad_y(i,j,k)+v3filter4n_grad_y(i,j,k)*v3filter4n_grad_y(i,j,k)+...
w1filter4n_grad_y(i,j,k)*w1filter4n_grad_y(i,j,k)+w2filter4n_grad_y(i,j,k)*w2filter4n_grad_y(i,j,k)+w3filter4n_grad_y(i,j,k)*w3filter4n_grad_y(i,j,k)+...
u1filter4n_grad_z(i,j,k)*u1filter4n_grad_z(i,j,k)+u2filter4n_grad_z(i,j,k)*u2filter4n_grad_z(i,j,k)+u3filter4n_grad_z(i,j,k)*u3filter4n_grad_z(i,j,k)+...
v1filter4n_grad_z(i,j,k)*v1filter4n_grad_z(i,j,k)+v2filter4n_grad_z(i,j,k)*v2filter4n_grad_z(i,j,k)+v3filter4n_grad_z(i,j,k)*v3filter4n_grad_z(i,j,k)+...
w1filter4n_grad_z(i,j,k)*w1filter4n_grad_z(i,j,k)+w2filter4n_grad_z(i,j,k)*w2filter4n_grad_z(i,j,k)+w3filter4n_grad_z(i,j,k)*w3filter4n_grad_z(i,j,k))/3;
end
end
end


for i=1:ni
for j=1:nj
for k=1:nk
    
    Er_2n(i,j,k)=nu*(-Er_a_2n(i,j,k)+Er_b_filter_2n(i,j,k));
    Er_4n(i,j,k)=nu*(-Er_a_4n(i,j,k)+Er_b_filter_4n(i,j,k));
end
end
end

Er_mean_2n(1:nj)=0;
epsilon_f_mean_2n(1:nj)=0;
Er_mean_4n(1:nj)=0;
epsilon_f_mean_4n(1:nj)=0;
for i=1:ni
for j=1:nj
for k=1:nk
    
    Er_mean_2n(j)=Er_mean_2n(j)+Er_2n(i,j,k)/ni/nk;
    epsilon_f_mean_2n(j)=epsilon_f_mean_2n(j)+epsilon_f_2n(i,j,k)/ni/nk;
    Er_mean_4n(j)=Er_mean_4n(j)+Er_4n(i,j,k)/ni/nk;
    epsilon_f_mean_4n(j)=epsilon_f_mean_4n(j)+epsilon_f_4n(i,j,k)/ni/nk;

end
end
end


%K_2=epsilon_f_mean_2n./Er_mean_2n ;
%K_4=epsilon_f_mean_4n./Er_mean_4n ;
%plot(y(1:nj/2),K_2(1:nj/2));
%hold on;
%plot(y(1:nj/2),K_4(1:nj/2));
%hold on;
%xlabel('y')
%ylabel({'$\langle  \epsilon_{f} \rangle / \langle \epsilon_{r} \rangle $'},'Interpreter', 'LaTeX','FontSize',15)
%legend('n=2','n=4')

J=Er_mean_2n./Production_exact_mean_2n ;
T=Er_mean_4n./Production_exact_mean_4n ;
plot(y,J);
hold on;
plot(y,T);
hold on;


xlabel('y')
ylabel({'$\langle \epsilon_{r} \rangle / \langle P_{r} \rangle $'},'Interpreter', 'LaTeX','FontSize',15)
legend('n=2 ','n=4')



