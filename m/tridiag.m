function x = tridiag(a,b,c,r)
% 3중대각 시스템의 풀이
% input
%   a: 대각하부 원소들의 벡터
%   b: 주대각 원소들의 벡터
%   c: 대각상부 원소들의 벡터
%   r: 시스템의 우변 벡터
% output
%   x: 해 벡터

n = length(b);
for k = 2:n % 소거
    factor = a(k)/b(k-1); b(k) = b(k) - factor*c(k-1); r(k) = r(k) - factor*r(k-1);
end
x(n) = r(n)/b(n); % 치환
for k = n-1:-1:1, x(k) = (r(k)-c(k)*x(k+1))/b(k); end
end