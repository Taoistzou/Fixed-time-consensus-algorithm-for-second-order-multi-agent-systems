clear all; 
close all;
x0=[-8 -2 2 6 9 2 1 3 2 1];
ts=0.01;
T=6;
TimeSet=[0:ts:T];
u=zeros(101,5);
[t,y]=ode45('ode45_protocol_5f',TimeSet,x0);

x1=y(:,1);
x2=y(:,2);                                  
x3=y(:,3);
x4=y(:,4);                                 
x5=y(:,5);                                 
x6=y(:,6);                                  
x7=y(:,7);  
x8=y(:,8);                                      
x9=y(:,9); 
x10=y(:,10); 
figure(1);
plot(t,x1,t,x2,t,x3,t,x4,t,x5);
xlabel('time(s)');ylabel('positions of agents');
figure(2);
plot(t,x6,t,x7,t,x8,t,x9,t,x10,'m--');
xlabel('time(s)');ylabel('velocities of agents');

