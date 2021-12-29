%% HW8 Problem 1
close all
clear all
clc
%% Initializing matrices
A = [1 2;3 4;5 0;0 6];
y = [1.5377;3.6948;-7.7193;7.3621];
Q = [1 0.5 0.5 0.25;0.5 2 0.25 1;0.5 0.25 2 1;0.25 1 1 4];
%% Part a
C_a = A(1:2,1:2);
y_a = y(1:2);
Q_a = Q(1:2,1:2);
x_blue_a = inv(C_a'*inv(Q_a)*C_a)*C_a'*inv(Q_a)*y_a;
cov_a = inv(C_a'*inv(Q_a)*C_a);
%% Part b
C_b = A(1:3,1:2);
y_b = y(1:3);
Q_b = Q(1:3,1:3);
x_blue_b = inv(C_b'*inv(Q_b)*C_b)*C_b'*inv(Q_b)*y_b;
cov_b = inv(C_b'*inv(Q_b)*C_b);
%% Part c
x_blue_c = inv(A'*inv(Q)*A)*A'*inv(Q)*y;
cov_c = inv(A'*inv(Q)*A);