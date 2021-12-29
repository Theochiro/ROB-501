%% HW11 P7
clear all
close all
clc 
%% Initialize 
A = [1 2;-3 7;4 5];
b = [3;2;12];
[m,n] = size(A);
%% One Norm
X_one_norm = linprog([zeros(1,n) ones(1,m)],[A -eye(m);-A -eye(m)],[b;-b]);
%% Inifinity Norm
X_inf_norm = linprog([zeros(1,n) 1],[A -ones(m,1); -A -ones(m,1)],[b;-b]);
%% Solution
% X_one_norm_sol = [1.7209;1.0233];
% X_inf_norm_sol = [1.6949;0.9322];