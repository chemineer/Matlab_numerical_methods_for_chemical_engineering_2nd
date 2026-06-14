function P = bairs(a)
% Bairstow 방법의 수행
kmax = 3; n = length(a) - 1; p = 1; q = 1;
for k = 1:kmax
    b(1) = a(1); b(2) = a(2) - b(1)*p;
    for j = 2:n, b(j+1) = a(j+1) - b(j)*p - b(j-1)*q; end
    c(1) = b(1); c(2) = b(2) - c(1)*p;
    for j = 2:n-1, c(j+1) = b(j+1) - c(j)*p - c(j-1)*q; end


    A = [c(n-1) c(n-2); (c(n)-b(n)) c(n-1)]; r = [b(n); b(n+1)]; x = A\r;
    p = p + x(1); q = q + x(2);
end
P = [1 p q];
end
