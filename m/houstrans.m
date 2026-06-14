function T = houstrans(A)
% A: n×n 대칭행렬, T: 삼각대각(tridiagonal) 행렬
[n n] = size(A);
for k = 1:n-2
    s = norm(A(k+1:n,k));
    if (A(k+1,k) < 0), s = -s; end
    r = sqrt(2*s*(A(k+1,k) + s));
    u(1:k) = zeros(1,k); v(1:k) = zeros(1,k); q(1:k) = zeros(1,k);

    u(k+1) = (A(k+1,k) + s)/r; u(k+2:n) = A(k+2:n,k)'/r;
    v(k+1:n) = A(k+1:n,k+1:n)*u(k+1:n)';
    c = u(k+1:n)*v(k+1:n)'; q(k+1:n) = v(k+1:n) - c*u(k+1:n)';
    A(k+2:n,k) = zeros(n-k-1,1); A(k,k+2:n) = zeros(1,n-k-1);
    A(k+1,k) = -s; A(k,k+1) = -s;
    A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - 2*u(k+1:n)'*q(k+1:n) 
    - 2*q(k+1:n)'*u(k+1:n);
end
T = A;
end