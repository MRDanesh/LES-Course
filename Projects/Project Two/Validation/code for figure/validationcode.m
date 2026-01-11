clear all;
clc;
load valid_33_U.out
u=valid_33_U(:,:);
Nx=33;
h = 2*pi/Nx;
x=0:h:2*pi-h;
u0=u(1,:);
u1=u(21,:);
u2=u(41,:);
u4=u(81,:);
u6=u(121,:);
plot(x,u0);
hold on;
plot(x,u1);
hold on;
plot(x,u2);
hold on;
plot(x,u4);
hold on;
plot(x,u6);
hold on;
legend({'$ Time=0 $','$ Time=0.1 $','$ Time=0.2 $','$ Time=0.4 $','$ Time=0.6 $'},'Interpreter', 'LaTeX','FontSize',12)

