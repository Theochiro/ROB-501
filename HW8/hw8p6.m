%% HW8 Problem 6
close all
clear all
clc
%% Initializing matrices
C = [1 2;3 4;5 0;0 6];
y = [1.5377;3.6948;-7.7193;7.3621];
Q = [1 0.5 0.5 0.25;0.5 2 0.25 1;0.5 0.25 2 1;0.25 1 1 4];
P = [0.5 0.25; 0.25 0.5];
x_mean = [1;-1];
err_mean = 0;
y_mean = C*x_mean+err_mean;
%% Solving using MVE with non-zero mean
x_mve = x_mean +P*C'*inv(C*P*C'+Q)*(y-y_mean);
cov = P-P*C'*inv(C*P*C'+Q)*C*P;