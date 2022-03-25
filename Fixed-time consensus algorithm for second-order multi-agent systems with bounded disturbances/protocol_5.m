clear all
close all 
clc
% x=[-8 -2 2 6 9 ]*1;
x=[-8 -2 2 6 9 ]*10;
v=[2 1 3 2 1]*1;
c1=2;c2=2;c3=0.25;c4=1;
alpha=0.5;beta=1.5;
p=0.5;q=1.5;
F=0;
A=1;
h=0.01;
t=5;
Ts=0:h:t;
u2=[];
x1=[];
v1=[];
E2=[];
for P=0:h:t
    x1=[x1;x];
    v1=[v1;v];
    u=0;u1=[];
    E=[];
    for m=1:5
        if m==1
            e1=v1(A,1)+c1*sig(x1(A,1)-x1(A,2)+x1(A,1)-x1(A,3),alpha)+c2*sig(x1(A,1)-x1(A,2)+x1(A,1)-x1(A,3),beta);%%%速度跟踪误差
            u=-c3*sig(e1,p)-c4*sig(e1,q)-c1*alpha*abs(x1(A,1)-x1(A,2)+x1(A,1)-x1(A,3))^(alpha-1)*(v1(A,1)-v1(A,2)+v1(A,1)-v1(A,3))-c2*beta*abs(x1(A,1)-x1(A,2)+x1(A,1)-x1(A,3))^(beta-1)*(v1(A,1)-v1(A,2)+v1(A,1)-v1(A,3))-F*sign(e1);
            u1=[u1 u];
            E=[E e1];
        end
        if m==2
            e2=v1(A,2)+c1*sig(x1(A,2)-x1(A,1)+x1(A,2)-x1(A,3)+x1(A,2)-x1(A,5),alpha)+c2*sig(x1(A,2)-x1(A,1)+x1(A,2)-x1(A,3)+x1(A,2)-x1(A,5),beta);
             u=-c3*sig(e2,p)-c4*sig(e2,q)-c1*alpha*abs(x1(A,2)-x1(A,1)+x1(A,2)-x1(A,3)+x1(A,2)-x1(A,5))^(alpha-1)*(v1(A,2)-v1(A,1)+v1(A,2)-v1(A,3)+v1(A,2)-v1(A,5))-c2*beta*abs(x1(A,2)-x1(A,1)+x1(A,2)-x1(A,3)+x1(A,2)-x1(A,5))^(beta-1)*(v1(A,2)-v1(A,1)+v1(A,2)-v1(A,3)+v1(A,2)-v1(A,5))-F*sign(e2);
             u1=[u1 u];
             E=[E e2];
        end
         if m==3
             e3=v1(A,3)+c1*sig(x1(A,3)-x1(A,1)+x1(A,3)-x1(A,2)+x1(A,3)-x1(A,4),alpha)+c2*sig(x1(A,3)-x1(A,1)+x1(A,3)-x1(A,2)+x1(A,3)-x1(A,4),beta);
             u=-c3*sig(e3,p)-c4*sig(e3,q)-c1*alpha*abs(x1(A,3)-x1(A,1)+x1(A,3)-x1(A,2)+x1(A,3)-x1(A,4))^(alpha-1)*(v1(A,3)-v1(A,1)+v1(A,3)-v1(A,2)+v1(A,3)-v1(A,4))-c2*beta*abs(x1(A,3)-x1(A,1)+x1(A,3)-x1(A,2)+x1(A,3)-x1(A,4))^(beta-1)*(v1(A,3)-v1(A,1)+v1(A,3)-v1(A,2)+v1(A,3)-v1(A,4))-F*sign(e3);
             u1=[u1 u];
             E=[E e3];
         end
         if m==4
             e4=v1(A,4)+c1*sig(x1(A,4)-x1(A,3)+x1(A,4)-x1(A,5),alpha)+c2*sig(x1(A,4)-x1(A,3)+x1(A,4)-x1(A,5),beta);
             u=-c3*sig(e4,p)-c4*sig(e4,q)-c1*alpha*abs(x1(A,4)-x1(A,3)+x1(A,4)-x1(A,5))^(alpha-1)*(v1(A,4)-v1(A,3)+v1(A,4)-v1(A,5))-c2*beta*abs(x1(A,4)-x1(A,3)+x1(A,4)-x1(A,5))^(beta-1)*(v1(A,4)-v1(A,3)+v1(A,4)-v1(A,5))-F*sign(e4);
             u1=[u1 u];
             E=[E e4];
         end
          if m==5
             e5=v1(A,5)+c1*sig(x1(A,5)-x1(A,4)+x1(A,5)-x1(A,2),alpha)+c2*sig(x1(A,5)-x1(A,4)+x1(A,5)-x1(A,2),beta);
             u=-c3*sig(e5,p)-c4*sig(e5,q)-c1*alpha*abs(x1(A,5)-x1(A,4)+x1(A,5)-x1(A,2))^(alpha-1)*(v1(A,5)-v1(A,2)+x1(A,5)-x1(A,4))-c2*beta*abs(x1(A,5)-x1(A,4)+x1(A,5)-x1(A,2))^(beta-1)*(v1(A,5)-v1(A,2)+x1(A,5)-x1(A,4))-F*sign(e5);
             u1=[u1 u];
             E=[E e5];
         end
          
    end

    u2=[u2;u1];
    E2=[E2;E];
    v(1,1)=v(1,1)+h*(u1(1,1)+F*sin(P));
    v(1,2)=v(1,2)+h*(u1(1,2)+F*sin(P));
    v(1,3)=v(1,3)+h*(u1(1,3)+F*sin(P));
    v(1,4)=v(1,4)+h*(u1(1,4)+F*sin(P));
    v(1,5)=v(1,5)+h*(u1(1,5)+F*sin(P));
    
    x(1,1)=x(1,1)+h*v(1,1);
    x(1,2)=x(1,2)+h*v(1,2);
    x(1,3)=x(1,3)+h*v(1,3);
    x(1,4)=x(1,4)+h*v(1,4);
    x(1,5)=x(1,5)+h*v(1,5);
    
    A=A+1;
end
% figure(1)
% % subplot(1,2,1)
% plot(Ts,x1,'Linewidth',2)
% xlabel('时间/s','FontSize',15);ylabel('智能体的位置状态轨迹误差','FontSize',15);
% title({'智能体的位置初始值 x(0)=(-8,-2,2,6,9)'},'FontSize',20);% title换行，两行的内容用分号隔开，再用大括号括起来。
% % title({'智能体的位置初始值 x(0)=(-80,-20,20,60,90)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
% set(gca,'FontSize',15);
% legend('x1','x2','x3','x4','x5')




% figure(2)
% % subplot(1,2,2)
% plot(Ts,v1,'Linewidth',2)
% xlabel('时间/s','FontSize',15);ylabel('智能体的速度状态轨迹','FontSize',15);
% title({'智能体的速度初始值 v(0)=(2,1,3,2,1)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
% set(gca,'FontSize',15);
% legend('v1','v2','v3','v4','v5')

figure(1)
plot(Ts,x1,'Linewidth',1.5)
xlabel('时间/s');ylabel('智能体的位置状态轨迹误差');
% title({'智能体的位置初始值 x(0)=(-8,-2,2,6,9)'},'FontSize',20);% title换行，两行的内容用分号隔开，再用大括号括起来。
% title({'智能体的位置初始值 x(0)=(-80,-20,20,60,90)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
% set(gca,'FontSize',15);
legend('$x_1$','$x_2$','$x_3$','$x_4$','$x_5$','interpreter','latex','linewidth',1.5,'fontsize',15);


figure(2)
% subplot(1,2,2)
plot(Ts,v1,'Linewidth',1.5)
xlabel('时间/s');ylabel('智能体的速度状态轨迹');
% title({'智能体的速度初始值 v(0)=(2,1,3,2,1)'},'FontSize',15);% title换行，两行的内容用分号隔开，再用大括号括起来。
% set(gca,'FontSize',15);
legend('$v_1$','$v_2$','$v_3$','$v_4$','$v_5$','interpreter','latex','linewidth',1.5,'fontsize',15);





% figure(3)
% plot(Ts,u2);
% xlabel('time(s)');ylabel('control inpit of agents');
% 
% figure(4)
% plot(Ts,E2);
% xlabel('time(s)');ylabel('The errors of agents');

% plot(Ts,x1,'LineWidth',2);
% xlabel('时间/s','FontSize',12);ylabel('智能体的位置状态轨迹','FontSize',12);
% legend('x1','x2','x3','x4','x5','x6')
% % title({'智能体的初始值 x(0)=(5,-1,8,2,-2,-7)'},'FontSize',12);% title换行，两行的内容用分号隔开，再用大括号括起来。
% title({'智能体的初始值 x(0)=(50,-10,80,20,-20,-70)'},'FontSize',12);% title换行，两行的内容用分号隔开，再用大括号括起来。



