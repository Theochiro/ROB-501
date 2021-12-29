%% HW8 Problem 5
close all
clear all
clc
%% Initializing matrices
C = [1 2;3 4;5 0;0 6];
y = [1.5377;3.6948;-7.7193;7.3621];
Q = eye(4);
P_1 = 1e2*eye(2);
P_2 = 1e6*eye(2);
S=eye(size(C,1));
%% Part a
x_wls = inv(C'*S*C)*C'*S*y;
%% Part b
x_blue = inv(C'*inv(Q)*C)*C'*inv(Q)*y;
%% Part c
x_mve_1 = inv(C'*inv(Q)*C+inv(P_1))*C'*inv(Q)*y;
x_mve_2 = inv(C'*inv(Q)*C+inv(P_2))*C'*inv(Q)*y;