%% FINAL PROBLEM 7
clear all
clc
%% Model + Initializing
% z_k+1 = A_k*z_k + G_k*w_k
% y_1k = C_1k*z_k + v_1k;
% y_2k = C_2k*z_k +v_2k;
A_k = [1 0.1;0 1];
G_k = [0.1;0.2];
C_1k = [1 1];
C_2k = [0.1 1];
R_k = 2;
Q_1k = 2;
Q_2k = 1;
z_2_2 = [2;0.5];
P_2_2 = [2 1;1 4];
%% Part a
z_3_2 = A_k*z_2_2;
%% Part b
y_3_1 = 2.5;
P_3_2 = A_k*P_2_2*A_k'+G_k*R_k*G_k';
K_3_1 = P_3_2*C_1k'*inv(C_1k*P_3_2*C_1k'+Q_1k);
z_3_3_1 = z_3_2 + K_3_1*(y_3_1 - C_1k*z_3_2);
%% Part c
y_3_2 = 0.7;
P_3_2 = A_k*P_2_2*A_k'+G_k*R_k*G_k';
K_3_2 = P_3_2*C_2k'*inv(C_2k*P_3_2*C_2k'+Q_2k);
z_3_3_2 = z_3_2 + K_3_2*(y_3_2 - C_2k*z_3_2);
%% Part d
P_3_3_1 = P_3_2 - P_3_2*C_1k'*inv(C_1k*P_3_2*C_1k'+Q_1k)*C_1k*P_3_2;
P_3_3_2 = P_3_2 - P_3_2*C_2k'*inv(C_2k*P_3_2*C_2k'+Q_2k)*C_2k*P_3_2;
%% Part e
A_eq = [1 0 0 0 0 0;1 -1 0 0.1 0 0;0 1 -1 0 0.1 0];
B_eq = [2;0;0];
A_in = [0  0  0  1  0  -1 ;0  0  0  -1  0  -1 ;0  0  0  0  1  -1 ; ...
        0  0  0  0  -1  -1 ;0  0  1  0  0  0 ;0  0  -1  0  0  0] ;
B_in = [0;0;0;0;0.1;0.1];
% Inifinity Norm
X_inf_norm = linprog([zeros(1,5) 1],A_in,B_in,A_eq,B_eq);