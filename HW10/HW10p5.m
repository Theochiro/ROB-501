%% HW10 Problem5
clear all
clc
%% Initializing
A = [4.041 7.046 3.014;10.045 17.032 7.027;16.006 27.005 11.048];
%% SVD + rank 2 approximation
[U,S,V] = svd(A);
[sig_r,idx] = min(S(S~=0));
del_A = -sig_r*U(:,idx)*V(:,idx)';
[~,L] = eig(del_A'*del_A);
l_max = max(L(L~=0));
A_hat = A+del_A;
%% Sanity Check
norm_del_A = sqrt(l_max);
rank(A_hat)