function [x,res] = gmresd(A,b,x0,m)
% Generalized minimal residual 방법에 의한 선형 시스템 Ax=b의 풀이
% input:
%   A,b: 선형방정식 시스템의 계수행렬과 우변벡터(Ax=b)
%   m: 단계 수
%   x0: 해의 초기값
% output:
%   x: 근사해 벡터
%   res: 잔류편차

n = length(x0); r0 = b - A*x0; nr0 = norm(r0); v(:,1) = r0/nr0; H = zeros(m+1,m);
for j = 1:m
    w(:,j) = A*v(:,j);
    for i = 1:j, H(i,j) = w(:,j)'*v(:,i); w(:,j) = w(:,j) - H(i,j)*v(:,i);
    end

    H(j+1,j) = norm(w(:,j));
    if H(j+1,j) == 0, m = j; break; end
    v(:,j+1) = w(:,j)/H(j+1,j);
end
G(1:m+1,:) = 0; G(1,:) = nr0;
for j = 1:m
    P = eye(m+1); s = H(j+1,j)/(sqrt(H(j+1,j)^2 + H(j,j)^2));
    c = H(j,j)/(sqrt(H(j+1,j)^2 + H(j,j)^2)); P(j,j) = c; P(j+1,j+1) = c;
    P(j,j+1) = s; P(j+1,j) = -s; H = P*H; G = P*G;
end
R(1:m, 1:m) = H(1:m, 1:m); % H의 마지막 행을 무시
yk = R\G(1:m); xm = x0 + v(1:n, 1:m)*yk; x = xm; res = b - A*x;
end