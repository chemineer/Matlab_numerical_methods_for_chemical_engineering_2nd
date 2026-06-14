function [Q R] = qrhold(A)
% Householder 변환을 이용하는 QR 분해
[n,m] = size(A); R = A; Q = eye(n);
for k = 1:n-1
    x = zeros(n,1); x(k:n,1) = R(k:n,k); g = norm(x); v = x; v(k) = x(k) + g; s = norm(v);
    if s ~= 0, w = v/s; u = 2*R'*w; R = R - w*u'; Q = Q - 2*Q*w*w'; end
end