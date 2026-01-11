close all
clear all
% ***** read u
load u_v_time_4nodes.dat
u1=u_v_time_4nodes(:,1);
v1=u_v_time_4nodes(:,2);
u2=u_v_time_4nodes(:,3);
v2=u_v_time_4nodes(:,4);
u3=u_v_time_4nodes(:,5);
v3=u_v_time_4nodes(:,6);
u4=u_v_time_4nodes(:,7);
v4=u_v_time_4nodes(:,8);

% time step=0.0033
dt=0.0033;
n=length(u1);
% compute time array
t=dt:dt:n*dt;

%%%%%%%%%%%%%%%% plotting section %%%%%%%%%%%%%%%%%%%%%%%%%%

% plot u
plot(t,u2)
hold
plot(t,u3,'r--')
xlabel('t')
ylabel('u')
handle=gca
set(handle,'fontsi',[20])
print u_time.ps -deps
%
axis([10 11 3 21])
