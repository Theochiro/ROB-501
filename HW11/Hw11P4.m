%% HW11 P4
clear all
close all
clc
%% Initialize
x_0 = [-1;0];
n = 100;
x = zeros(2,n);
x(:,1) = x_0;
%% Newton Raphson
for i=1:n
    [h,del_h] = hw11p4(x(:,i));
    x(:,i+1) = x(:,i) - inv(del_h)*h;
end
%% Solution
% x = [-1.4295;-2.7774] with initial condition [0;0]
% x = [NaN;NaN] with initial conditions [1;-1] [7;9]
% We notice that for negative initial conditions, it does not matter how
% far off it is, it will always converge to the minima
%% Functions
function  [h,del_h] = hw11p4(x)
h = [3;4] - [1 2;3 4]*x-x*x'*[1;2];
del_h = [1-2*x(1)-2*x(2) 2-2*x(1); 3-x(2) 4-x(1)-4*x(2)];
end