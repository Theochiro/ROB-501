%% FINAL PROBLEM 8
clear all
close all
clc 
%% Initialize 
Y_1 = [1 1;0 1];
Y_2 = [-1 0;1 -1];
Y_1_A = 4;
Y_2_A = 2;
%% Part c Method 1
A_s = [1 3;3 0];
A_s2 = [0 3;3 1];
sqrt(trace(A_s'*A_s)) - sqrt(trace(A_s2'*A_s2))
sqrt(trace(A_s'*Y_1)) - sqrt(trace(A_s2'*Y_1))
sqrt(trace(A_s'*Y_2)) - sqrt(trace(A_s2'*Y_2))
%% Part c Method 2
G = [trace(Y_1'*Y_1) trace(Y_1'*Y_2); trace(Y_2'*Y_1) trace(Y_2'*Y_2)];
Beta = [Y_1_A; Y_2_A];
alpha = inv(G)'*Beta;
A_star = alpha(1)*Y_1 + alpha(2)*Y_2;
