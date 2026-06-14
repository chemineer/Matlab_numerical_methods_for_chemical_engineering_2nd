function [L U] = luchols(A)
% 대칭행렬 A의 LU 분해: Cholesky 분해
[n m] = size(A); L = zeros(n,n); U = A;
for k = 1:n
    L(k,k) = sqrt(A(k,k) - L(k,1:k-1)*L(k,1:k-1)');
    for j = k+1:n, L(j,k) = (A(j,k) - L(j,1:k-1)*L(k,1:k-1)')/L(k,k); end
end
U = L';
end