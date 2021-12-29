%% HW9 P6
A = [1 2; 3 4;5 6];
%% Gram Schmidt
A_1 = A(:,1);
A_2 = A(:,2);
v_1 = A_1/norm(A_1);
v_2 = A_2 - A_2'*v_1*v_1;
v_2 = v_2/norm(v_2);
Q = [v_1 v_2];
R_1= inv(Q'*Q)*Q'*A_1;
R_2= inv(Q'*Q)*Q'*A_2;
R = [R_1 R_2];
% Sanity Check
Q'*Q - eye(2)
[Q_1,R_1] = qr(A);
[Q_2,R_2] = qr(A,0);