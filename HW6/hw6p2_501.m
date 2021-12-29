%% Initialize
clear all
clc
load DataHW06_Prob2.mat;
dt = t(2) - t(1);
%% Part a
dy_naive = diff(y)/dt;
hold on
plot(t(1:end-1),dy_naive,'--');
plot(t,dy);
legend('Naive Derivative','True Derivative','Interpreter','latex')
title('\textbf{Derivative $\frac{dy(t)}{dt}$}','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
ylabel('$\frac{dy(t)}{dt}$','Interpreter','latex')
set(gca,'fontsize',40)
%% Part b
y_test=y;
dy_test=dy;
M=3;
figure(2)
hold on
for k=M:length(t)
    Y_k=y_test(k-M+1:k);
    T_k=t(k-M+1:k);
    dY_k=dy_test(k-M+1:k);
    N=length(Y_k);
    A=[ones(N,1) T_k T_k.^2];
    alpha_hat = inv(A'*A)*A'*Y_k;
    c0 = alpha_hat(1);
    c1 = alpha_hat(2);
    c2 = alpha_hat(3);
  plot(T_k,dY_k,'-r',T_k,c1+2*c2*T_k,'--b');
end
axis([t(1) t(end) min(dy) max(dy)]);
legend('True Derivative','Regression','Interpreter','latex')
title('\textbf{Derivative $\frac{dy(t)}{dt}$}','Interpreter','latex')
xlabel('$t$','Interpreter','latex')
ylabel('$\frac{dy(t)}{dt}$','Interpreter','latex')
set(gca,'fontsize',40)
%% End