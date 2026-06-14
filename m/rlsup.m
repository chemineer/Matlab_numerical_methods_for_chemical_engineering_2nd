function [x,K,P] = rlsup(Ak,bk,x,P)
K = P*Ak'/(Ak*P*Ak' + 1);
x = x + K*(bk - Ak*x);
P = P - K*Ak*P;
end