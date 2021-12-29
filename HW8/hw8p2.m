%% HW8 Problem 2
close all
clear all
clc
%% Initializing 
syms z
syms x
syms y
mu = [-1;0;1];
cov = [2 2 1;2 4 2;1 2 2];
%% Part a
mu_1 = mu(1:2);
mu_z = mu(3);
cov_11 = cov(1:2,1:2);
cov_22 = cov(3,3);
cov_21 = cov(3,1:2);
cov_12 = cov_21';
mu_12 = mu_1+cov_12*inv(cov_22)*(z-mu_z);
sig_12 = cov_11-cov_12*inv(cov_22)*cov_21;
f_12 = inv(sqrt((2*pi)^2*abs(sig_12)))*exp(-1/2*(([x;y]-mu_12)'*inv(sig_12)*([x;y]-mu_12)));
%% Part b
mu_1_b = mu_12(1);
mu_2_b = mu_12(2);
cov_11_b = sig_12(1,1);
cov_22_b = sig_12(2,2);
cov_21_b = sig_12(1,2);
cov_12_b = cov_21_b';
mu_12_b = mu_1_b+cov_12_b*inv(cov_22_b)*(y-mu_2_b);
sig_12_b = cov_11_b-cov_12_b*inv(cov_22_b)*cov_21_b;
f_12_b = inv(sqrt((2*pi)*abs(sig_12_b)))*exp(-1/2*((x-mu_12_b)'*inv(sig_12_b)*(x-mu_12_b)));
%% Part c
mu_1_c = mu(1);
mu_2_c = mu(2:3);
cov_11_c = cov(1,1);
cov_22_c = cov(2:3,2:3);
cov_12_c = cov(1,2:3);
cov_21_c = cov_12_c';
mu_12_c = mu_1_c+cov_12_c*inv(cov_22_c)*([y;z]-mu_2_c);
sig_12_c = cov_11_c-cov_12_c*inv(cov_22_c)*cov_21_c;
f_12_c = inv(sqrt((2*pi)*abs(sig_12_c)))*exp(-1/2*((x-mu_12_c)'*inv(sig_12_c)*(x-mu_12_c)));