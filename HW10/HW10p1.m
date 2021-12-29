%% HW10 Problem1
clear all
clc
%% Initializing
syms x [1 3]
f = 3*x1*(2*x2-x3^3)+x2^4/3;
J = [diff(f,x1) diff(f,x2) diff(f,x3)];
n = 6;
del = flip(2.^(-n:2));
J_sym = zeros(3,length(del));
%% Sanity Check
x1 = 1; x2 = 3; x3 = -1; 
J_sol = double(subs(J)');
%% Compute Symmetric estimate 
f1 = @(x1,x2,x3) 3*x1*(2*x2-x3^3)+x2^4/3;
x_star = [1 3 -1];
e = 1;
for i=1:length(del)
    J_sym(1,i) = (f1(x_star(1)+del(i)*e,x_star(2),x_star(3))-f1(x_star(1)-del(i)*e,x_star(2),x_star(3)))/(2*del(i));
    J_sym(2,i) = (f1(x_star(1),x_star(2)+del(i)*e,x_star(3))-f1(x_star(1),x_star(2)-del(i)*e,x_star(3)))/(2*del(i));
    J_sym(3,i) = (f1(x_star(1),x_star(2),x_star(3)+del(i)*e)-f1(x_star(1),x_star(2),x_star(3)-del(i)*e))/(2*del(i));
end
%% Choose most accurate solution
[del_min,idx] = min(vecnorm(J_sym-J_sol,2,1));
del_opt = del(idx);