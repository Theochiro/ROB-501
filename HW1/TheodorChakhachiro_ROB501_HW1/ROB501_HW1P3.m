%% Theodor Chakhachiro ROB 501 HW1 Problem 3
clear all
clc
%% Initialization
n=4;
m=3;
A=zeros(n,m,10);
%% Computing Eigenvalues and Eigenvectors
for i=1:length(A)
    A(:,:,i)=randn(n,m);
    M(:,:,i)=A(:,:,i)'*A(:,:,i);
    [V(:,:,i),L(:,:,i)]=eig(M(:,:,i));
    %% Checking that the sum of the eigenvalues of a matrix is equal to the trace of that matrix
    L_sum(i)=trace(L(:,:,i));
    L_trace(i)=trace(M(:,:,i));
    Trace_check(i)=L_sum(i)-L_trace(i);
    %% Checking that the product of the eigenvalues is equal to the determinant of that matrix
    L_product(i)=prod(diag(L(:,:,i)));
    L_det(i)=det(M(:,:,i));
    Det_check(i)=L_det(i)-L_product(i);
end
%% Checking that the inner product of the eigenvectors of a matrix is equal to zero
for i=1:length(A)
    for j=1:m-1
        VecVal(i,j)=V(1:m,j,i)'*V(1:m,j+1,i);
    end
    VecVal(i,1:m)=[VecVal(i,1:m-1) V(1:m,1,i)'*V(1:m,m,i)];
end
%% End
