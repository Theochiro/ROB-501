%% HW10 Problem1 Part c
clear all
clc
%% Initializing
n = 10;
del = flip(2.^(-n:2));
J_sym = zeros(5,length(del));
%% Compute Symmetric estimate 
f1 = @(x1,x2,x3) 3*x1*(2*x2-x3^3)+x2^4/3;
x_star = [1 1 1 1 1];
e1 = [1 0 0 0 0];
e2 = [0 1 0 0 0];
e3 = [0 0 1 0 0];
e4 = [0 0 0 1 0];
e5 = [0 0 0 0 1];
for i=1:length(del)
    J_sym(1,i) = (funcPartC(x_star+del(i)*e1)-funcPartC(x_star-del(i)*e1))/(2*del(i));
    J_sym(2,i) = (funcPartC(x_star+del(i)*e2)-funcPartC(x_star-del(i)*e2))/(2*del(i));
    J_sym(3,i) = (funcPartC(x_star+del(i)*e3)-funcPartC(x_star-del(i)*e3))/(2*del(i));
    J_sym(4,i) = (funcPartC(x_star+del(i)*e4)-funcPartC(x_star-del(i)*e4))/(2*del(i));
    J_sym(5,i) = (funcPartC(x_star+del(i)*e5)-funcPartC(x_star-del(i)*e5))/(2*del(i));
end
%% Choose most accurate solution
J_sym
% [del_min,idx] = min(vecnorm(J_sym-J_sol,2,1));
% del_opt = del(idx);