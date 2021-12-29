%% FINAL PROBLEM 6
clear all
clc
%% Initialize
C_0 = [1 1;0 2;1 -1];
Q_0 = [0.7 -0.4 -0.1;-0.4 0.8 0.2; -0.1 0.2 0.3];
y_0 = [2;4;0];
%% Part a
x_hat = inv(C_0'*inv(Q_0)*C_0)*C_0'*inv(Q_0)*y_0;
%% Part b Method 1: without recursion
% Initializing new measurement
C_1 = [1 2];
y_1 = 4;
Q_1 = 0.01;
% Augmenting matrices
C = [C_0;C_1];
Q = [Q_0 zeros(3,1); zeros(1,3) Q_1];
y = [y_0;y_1];
% Estimating
x_new_m1 = inv(C'*inv(Q)*C)*C'*inv(Q)*y;
%% Part b Method 2: using recursion
% Initializing new measurement
C_1 = [1 2];
y_1 = 4;
Q_1 = 0.01;
P_1 = inv(C_0'*inv(Q_0)*C_0);
% Estimating
x_new_m2 = x_hat + (P_1*C_1'*inv(C_1*P_1*C_1'+Q_1))*(y_1-C_1*x_hat);
%% Comparison
% Comparing both results using each method, we realize that they are
% similar.