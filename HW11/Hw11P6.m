%% HW11 P6
clear all
close all
clc
%% Initialize
A_eq = ones(1,4);
b_eq = 2;
A_in = [1 2 3 4;5 6 7 8];
b_in = [9;10];
Q = [2 1 0 0;1 4 1 0;0 1 6 1;0 0 1 8];
x_0 = [1;2;3;4];
%% Part a
X_a = quadprog(2*eye(4),zeros(4,1),A_in,b_in,A_eq,b_eq);
%% Part b
X_b = quadprog(2*Q,(-2*x_0'*Q)',A_in,b_in,[],[]);
%% Solution
% X_a_sol = [1.4;0.8;0.2;-0.4];
% X_b_sol = [-3.2957;0.4005;1.0860;2.0591];