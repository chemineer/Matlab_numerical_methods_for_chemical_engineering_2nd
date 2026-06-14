function [z m] = maxeig(A,maxiter,tol)
% 반복과정에 의한 최대 고유치 계산
[n1 n2] = size(A); w = ones(n1,1);
for j = 1:maxiter
    [kk k] = max(abs(w)); z = w/w(k); w = A*z; m = w(k); r = norm(m*z - w);
    if r<tol, disp('반복과정은 수렴함.'); break; end
end
end