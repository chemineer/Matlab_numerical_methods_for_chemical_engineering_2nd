function [x,c] = gaushm(n)

% Gauss-Hermite 적분을 수행
if n <= 0, p = 1;
else
    p = [2 0]; for k = 2:n, p = 2*[p 0] - [0 0 polyder(p)]; end
end
x = roots(p)'; A(1,:) = ones(1,n); b(1) = sqrt(pi);
for k = 2:n
    A(k,:) = A(k-1,:).*x;
    if mod(k,2) == 1, b(k) = (k-2)/2 * b(k-2); else, b(k) = 0; end
end
c = b/A';
end