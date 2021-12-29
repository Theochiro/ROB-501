%% Exam-I Problem 7d
format rat
G = [3 0 1;0 2 -1;1 -1 2];
b = [3;-1;2];
u_1 = [1 1;0 1];
u_2 = [1 -1;0 0];
u_3 = [0 1;1 0];
alphas=inv(G)'*b;
x_hat=alphas(1)*u_1+alphas(2)*u_2+alphas(3)*u_3;