%% Theodor Chakhachiro ROB 501 HW1 Problem 7
clear all
clc
%% Initializing
n = 20;
x = [-n:.01:n];
f = p7func(x,10);
figure(1);
plot(x,f)
title('\textbf{Plot of the conditional density of $X$ given $Y=10$, $f_{X|Y}(X|10)$}','Interpreter','latex')
xlabel('$x$','Interpreter','latex')
ylabel('$f_{X|Y}(X|10)$','Interpreter','latex')
set(gca,'fontsize',40)
%% End