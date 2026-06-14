function z = rodtemp(f,g0,g1,xf,tf,n,m,a)
% 단위길이 막대의 1차원 온도분포
% inputs:
%   f: 초기조건을 나타내는 함수, g0, g1: 경계조건, xf: x방향 길이
%   tf: 최종시간, n,m: 각각 x 방향과 시간축의 소구간 수, a: 열 확산도
% output:
%   z: 온도값
h = xf/n; k = tf/m; % delta x 및 delta t
r = a*k/h^2; s = 1 - 2*r; x = 0:h:xf; t = 0:k:tf;
u(1:n+1,1) = f(x)'; % 초기조건
u(1,1:m+1) = g0(t); u(n+1,1:m+1) = g1(t); % 경계조건
for j = 1:m, u(2:n,j+1) = r*u(1:n-1,j) + s*u(2:n,j) + r*u(3:n+1,j); end
z = u'; mesh(x,t,z), xlabel('x'), ylabel('t'), zlabel('u')
end