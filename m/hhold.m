function u = hhold(x)
% Householder vector u를 계산
% (I - 2uu')x = alpha*e_1
n = length(x); % x의 원소 수
alpha = norm(x); v = zeros(n,1); v(1) = x(1) + sign(x(1))*alpha;

v(2:n) = x(2:n); u = v/norm(v);
end