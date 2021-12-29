%% Initialize
clear all
clc
load DataHW07_Prob4.mat
%% Part b
Q_n = [];
P_n = [];
E_k = [];
S_k = eye(3);
K_n = [];
Q_n = zeros(20);
Gamma = zeros(20,1);
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
figure(1)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)-1,E_k);
title('\textbf{Norm error in $\hat{x}$ using RLS with MIL}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,1.3,'$\Delta t_{elapsed}=0.0125 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)
%% Part c
A_k = [];
Y_k = [];
R_k = eye(3);
E_k = [];
lambda = 0.92;
A_k = [A_k;C{1}];
Y_k = [Y_k;y{1}];
tic
for i = 2 : ceil(length(x_actual{1})/rank(C{1}))-1
    A_k = [A_k;C{i}];
    Y_k = [Y_k;y{i}];
    R_k = [lambda*R_k zeros(3*(i-1),3);zeros(3,3*(i-1)) eye(3)];
end
for i = ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)
    A_k = [A_k;C{i}];
    R_k = [lambda*R_k zeros(3*(i-1),3);zeros(3,3*(i-1)) eye(3)];
    Y_k = [Y_k;y{i}];
    x_hat = inv(A_k'*R_k*A_k)*A_k'*R_k*Y_k;
    E_k = [E_k norm(x_actual{i}-x_hat)];
end
toc
figure(2)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual),E_k);
title('\textbf{Norm error in $\hat{x}$ using batch process with $\lambda=0.92$}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.4,'$\Delta t_{elapsed}=2.6599 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)
%% Part d RLS with MIL
Q_n = [];
P_n = [];
E_k = [];
lambda = 0.94;
Q_n = zeros(20);
Gamma = zeros(20,1);
tic
for i = 1 : ceil(length(x_actual{1})/rank(C{1}))
    Q_n = Q_n + C{i}'*lambda^(ceil(length(x_actual{1})/rank(C{1}))-1)*C{i};
    Gamma = Gamma + C{i}'*lambda^(ceil(length(x_actual{1})/rank(C{1}))-1)*y{i};
end
P_n = inv(Q_n);
x_hat = P_n*Gamma;
for k = i : length(x_actual)-1
    P_n = P_n/lambda-P_n*C{k}'*inv(lambda*eye(size(C{k}*P_n*C{k}'))+C{k}*P_n*C{k}')*C{k}*P_n;
%     P_n = MIL(P_n,C{k}',1/lambda,C{k});
    K_n = P_n*C{k}';
    x_hat = x_hat + K_n*(y{k}-C{k}*x_hat);
    E_k = [E_k norm(x_actual{k}-x_hat)];
end
toc
figure(3)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)-1,E_k);
title('\textbf{Norm error in $\hat{x}$ using RLS with MIL and $\lambda=0.94$}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.8,'$\Delta t_{elapsed}=0.0127 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)
%% Part d RLS
Q_n = [];
P_n = [];
E_k = [];
K_n = [];
lambda = 0.9;
Q_n = zeros(20);
Gamma = zeros(20,1);
tic
for i = 1 : ceil(length(x_actual{1})/rank(C{1}))
    Q_n = Q_n + C{i}'*lambda^(ceil(length(x_actual{1})/rank(C{1}))-1)*C{i};
    Gamma = Gamma + C{i}'*lambda^(ceil(length(x_actual{1})/rank(C{1}))-1)*y{i};
end
P_n = inv(Q_n);
x_hat = P_n*Gamma;
for k = i : length(x_actual)-1
    Q_n = lambda*Q_n+C{k}'*C{k};
    K_n = inv(Q_n)*C{k}';
    x_hat = x_hat + K_n*(y{k}-C{k}*x_hat);
    E_k = [E_k norm(x_actual{k}-x_hat)];
end
toc
figure(3)
plot(ceil(length(x_actual{1})/rank(C{1})) : length(x_actual)-1,E_k);
title('\textbf{Norm error in $\hat{x}$ using standard RLS with $\lambda=0.9$}','Interpreter','latex')
xlabel('$k$','Interpreter','latex')
ylabel('$E_k$','Interpreter','latex')
text(350,0.4,'$\Delta t_{elapsed}=0.01226 \; s$','FontSize',40,'Interpreter','latex')
set(gca,'fontsize',40)