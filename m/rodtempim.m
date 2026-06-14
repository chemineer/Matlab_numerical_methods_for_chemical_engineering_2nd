function z = rodtempim(f,g0,g1,xf,tf,n,m,a)

% 단위길이 막대의 1차원 온도분포(implicit 방법)
% inputs:
%   f: 초기조건을 나타내는 함수, g0, g1: 경계조건, xf: x 방향 길이
%   tf: 최종시간, n,m: 각각 x 방향과 시간축의 소구간 수, a: 열 확산도
% output:
%   z: 온도값
h = xf/n; k = tf/m; % delta x 및 delta t
r = a*k/h^2; x = 0:h:xf; t = 0:k:tf;
u(1:n+1,1) = f(x)'; % 초기조건
u(1,1:m+1) = g0(t); u(n+1,1:m+1) = g1(t); % 경계조건
d = (1 + 2*r)*ones(1,n-1); av = -r*ones(1,n-2); av(n-1) = 0;
b = -r*ones(1,n-1); b(1) = 0;
bv(1) = 0; dv(1) = d(1);
for i = 2:n-1, bv(i) = b(i)/dv(i-1); dv(i) = d(i) - bv(i)*av(i-1); end
for j = 1:m
    cv(1) = u(2,j) + r*u(1,j+1); cv(2:n-2) = u(3:n-1,j);
    cv(n-1) = u(n,j) + r*u(n+1,j+1); zv(1) = cv(1);
    for i = 2:n-1, zv(i) = cv(i) - bv(i)*zv(i-1); end
    xv(n-1) = zv(n-1)/dv(n-1);
    for i = n-2:-1:1, xv(i) = (zv(i) - av(i)*xv(i+1))/dv(i); end
    u(2:n,j+1) = xv(1:n-1)';
end
z = u'; mesh(x,t,z), xlabel('x'), ylabel('t'), zlabel('u')
end