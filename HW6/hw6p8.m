%% Initialize 
clear all
clc
format rat
%% Define matrices
A=eye(5);
A(2,2)=0.5;
A(3,3)=0.5;
A(5,5)=0.5;
B=[1;0;2;0;3];
C=0.2;
D=[1 0 2 0 3];
%% Call function
[inverse] = MIL(inv(A),B,C,D);
%% Function definition
function [inverse] = MIL(A,B,C,D)
%function input A is actually the inverse of A
inverse=A-A*B*inv((inv(C)+D*A*B))*D*A;
end
%% End