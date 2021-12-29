%% HW8 Problem 4
close all
clear all
clc
%% Initializing matrices
C = [1 2;3 4;5 0;0 6];
y = [1.5377;3.6948;-7.7193;7.3621];
Q = [1 0.5 0.5 0.25;0.5 2 0.25 1;0.5 0.25 2 1;0.25 1 1 4];
P = [0.5 0.25; 0.25 0.5];
%% Part a
C_a = C(1,:);
y_a = y(1);
Q_a = Q(1);
x_mve_a = inv(C_a'*inv(Q_a)*C_a+inv(P))*C_a'*inv(Q_a)*y_a;
cov_a = P-P*C_a'*inv(C_a*P*C_a'+Q_a)*C_a*P;
%% Part b
C_b = C(1:2,:);
y_b = y(1:2);
Q_b = Q(1:2,1:2);
x_mve_b = inv(C_b'*inv(Q_b)*C_b+inv(P))*C_b'*inv(Q_b)*y_b;
cov_b = P-P*C_b'*inv(C_b*P*C_b'+Q_b)*C_b*P;
%% Part c
C_c = C(1:3,:);
y_c = y(1:3);
Q_c = Q(1:3,1:3);
x_mve_c = inv(C_c'*inv(Q_c)*C_c+inv(P))*C_c'*inv(Q_c)*y_c;
cov_c = P-P*C_c'*inv(C_c*P*C_c'+Q_c)*C_c*P;
%% Part d
x_mve = inv(C'*inv(Q)*C+inv(P))*C'*inv(Q)*y;
cov = P-P*C'*inv(C*P*C'+Q)*C*P;