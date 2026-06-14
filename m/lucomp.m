function [L U] = lucomp(A)
% Gauss 소거법을 이용한 행렬 A의 LU 분해(LU factorization)
[n m] = size(A); L = eye(n); U = A;
for j = 1:n-1
    for k = j+1:n
        L(k,j) = U(k,j)/U(j,j); U(k,:) = U(k,:) - L(k,j)*U(j,:);
    end
end
end