%% HW10 Problem2 
clear all
clc
load SegwayData4KF.mat
%% Part a: One-step Kalman Filter
P_k = P0;
E_k = x0;
for i=1:2
    K_k = P_k*C'*inv(C*P_k*C'+Q);
    x_k = A*E_k+B*u(i)+A*K_k*(y(i)-C*E_k);
    P_k = A*(P_k-K_k*C*P_k)*A'+G*R*G';
end
%% Part b: Kalman Filter
P = cell(length(x0),length(x0),length(t));
K = zeros(length(x0),length(t));
x = zeros(size(K));
P{1} = P0;
x(:,1) = x0;
for i=1:length(t)-1
    K(:,i) = P{i}*C'*inv(C*P{i}*C'+Q);
    x(:,i+1) = A*x(:,i)+B*u(i)+A*K(:,i)*(y(i)-C*x(:,i));
    P{i+1} = A*(P{i}-K(:,i)*C*P{i})*A'+G*R*G';
end
%% Steady State values
[Kss,Pss] = dlqe(A,G,C,R,Q);
K_f = K(:,i);
P_f = P{i};
%% Plots
figure(1)
subplot(2,2,1);
plot(t,x(1,:));
title('\textbf{Plot of the estimate $\hat{\varphi}$ versus time $t$}','Interpreter','latex')
ylabel('$\hat{\varphi}$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
set(gca,'fontsize',20)

subplot(2,2,2);
plot(t,x(2,:));
title('\textbf{Plot of the estimate $\hat{\theta}$ versus time $t$}','Interpreter','latex')
ylabel('$\hat{\theta}$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
set(gca,'fontsize',20)

subplot(2,2,3);
plot(t,x(3,:));
title('\textbf{Plot of the estimate $\hat{\dot{\varphi}}$ versus time $t$}','Interpreter','latex')
ylabel('$\hat{\dot{\varphi}}$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
set(gca,'fontsize',20)

subplot(2,2,4);
plot(t,x(4,:));
title('\textbf{Plot of the estimate $\hat{\dot{\theta}}$ versus time $t$}','Interpreter','latex')
ylabel('$\hat{\dot{\theta}}$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
set(gca,'fontsize',20)

figure(2)
plot(t,K)
legend('$K_{\hat{\varphi}}$','$K_{\hat{\theta}}$','$K_{\hat{\dot{\varphi}}}$','$K_{\hat{\dot{\theta}}}$','Interpreter','latex')
title('\textbf{Plot of the Kalman gains $K$ versus time $t$}','Interpreter','latex')
ylabel('$K$','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
set(gca,'fontsize',40)