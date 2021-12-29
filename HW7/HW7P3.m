%% Initialize
clear all
clc
load DataHW07_Prob3.mat
%% Part b
A_k = [];
Y_k = [];
R_k = [];
E_k = [];
tic
for i = 1 : ceil(length(x_actual{1})/rank(C{1}))-1
    A_k = [A_k;C{i}];
    Y_k = [Y_k;y{i}];
end
for i = ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)
    A_k = [A_k;C{i}];
    R_k = eye(3*i);
    Y_k = [Y_k;y{i}];
    x_hat = (A_k'*R_k*A_k)\A_k'*R_k*Y_k;
    E_k = [E_k norm(x_actual{i}-x_hat)];
end
toc
figure(1)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual),E_k);
title('\textbf{Norm error in $\hat{x}$ using batch process}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.6,'$\Delta t_{elapsed}=1.2103 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)
%% Part c
Q_n = [];
E_k = [];
S_k = eye(3);
K_n = [];
Q_n = zeros(100);
Gamma = zeros(100,1);
tic
for i = 1 : ceil(length(x_actual{1})/rank(C{1}))
    Q_n = Q_n + C{i}'*S_k*C{i};
    Gamma = Gamma + C{i}'*S_k*y{i};
end
x_hat = Q_n\Gamma;
for k = i : length(x_actual)-1
    Q_n = Q_n + C{k}'*S_k*C{k};
    K_n = inv(Q_n)*C{k}'*S_k;
    x_hat = x_hat + K_n*(y{k}-C{k}*x_hat);
    E_k = [E_k norm(x_actual{k}-x_hat)];
end
toc
figure(2)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)-1,E_k);
title('\textbf{Norm error in $\hat{x}$ using standard RLS}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.6,'$\Delta t_{elapsed}=0.1219 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)
%% Part d
Q_n = [];
P_n = [];
E_k = [];
S_k = eye(3);
K_n = [];
Q_n = zeros(100);
Gamma = zeros(100,1);
tic
for i = 1 : ceil(length(x_actual{1})/rank(C{1}))
    Q_n = Q_n + C{i}'*S_k*C{i};
    Gamma = Gamma + C{i}'*S_k*y{i};
end
P_n = inv(Q_n);
x_hat = P_n*Gamma;
for k = i : length(x_actual)-1
    P_n = P_n-P_n*C{k}'*inv((inv(S_k)+C{k}*P_n*C{k}'))*C{k}*P_n;
    K_n = P_n*C{k}'*S_k;
    x_hat = x_hat + K_n*(y{k}-C{k}*x_hat);
    E_k = [E_k norm(x_actual{k}-x_hat)];
end
toc
figure(3)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)-1,E_k);
title('\textbf{Norm error in $\hat{x}$ using RLS with MIL}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.6,'$\Delta t_{elapsed}=0.0572 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)