function [Q,R] = gschmidt(A)
% 행렬 A의 Gram-Schmidt QR 인수화.
% [Q R] = gschmidt(A)에서 Q의 열 벡터들은 A의 column space에 대한
% orthonormal basis를 형성하며 R은 A=QR인 정방 upper triangular 행렬이다.
[m,n] = size(A); R = zeros(n);
if rank(A) ~= n, error('열 벡터들은 선형적으로 독립적이지 않음.'); end
Q = A;
for k = 1:n
    R(k,k) = norm(Q(:,k)); Q(:,k) = Q(:,k)/R(k,k);
    R(k,k+1:n) = Q(:,k)'*Q(:,k+1:n); Q(:,k+1:n) = Q(:,k+1:n) - Q(:,k)*R(k,k+1:n);
end