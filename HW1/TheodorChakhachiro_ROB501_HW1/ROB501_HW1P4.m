%% Theodor Chakhachiro ROB 501 HW1 Problem 4
clear all
clc
%% Initializing
bigstd_x = 3;
n = 4*bigstd_x;
x = [-n:.01:n];
y1 = normpdf(x,0,1);
y2 = normpdf(x,0,3);
figure(1);
hold on 
plot(x,y1)
plot(x,y2)
legend('$X \sim \mathcal{N}(0,1)$','$X \sim \mathcal{N}(0,3)$','Interpreter','latex')
title('\textbf{Plot of both normal distributions $X \sim \mathcal{N}(0,1)$ and $X \sim \mathcal{N}(0,3)$}','Interpreter','latex')
xlabel('$x$','Interpreter','latex')
ylabel('$f_X(x)$','Interpreter','latex')
set(gca,'fontsize',40)
%% Calculating Probabilities
% i) P(x>=4)
Q1 = integral(@(x)mynormaldist(2,5,x),4,inf);
% ii) P(-2<=x<=4)
Q2 = integral(@(x)mynormaldist(2,5,x),-2,4);
% iii
Q3 = integral(@(x)mynormaldist(2,5,x),-2,4) + integral(@(x)mynormaldist(2,5,x),8,100);
%% End