function [x,iter] = sucor(A,b,x0,w,tol,kmax)
% Successive over-relaxation 방법에 의한 선형 시스템 Ax=b의 풀이
% input:
%   A,b: 선형방정식 시스템의 계수행렬과 우변벡터(Ax=b)
%   w: 파라미터(1<w<2)
%   tol: 수렴한계
%   kmax: 허용 가능한 최대 반복계산 횟수

% output:
%   x: 근사해 벡터
%   iter: 반복계산 횟수

[n, m] = size(A); x = x0; C = -A; r = b; % C와 r을 초기화
for i = 1:n, C(i,i) = 0; end
for i = 1:n, C(i,1:n) = C(i,1:n)/A(i,i); r(i,1) = b(i)/A(i,i); end
iter = 1;
while iter <= kmax
    xk = x;
    for j = 1:n, x(j) = (1-w)*xk(j) + w*(C(j,:)*x + r(j)); end
    if norm(xk - x) <= tol, disp('Successive over-relaxation 방법은 수렴에 도달.');
    break;
    end
    iter = iter + 1;
end