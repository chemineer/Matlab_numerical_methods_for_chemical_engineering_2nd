function [x,y,U] = parheat2D(tf,a,b,m,n,p,alpha,f,g)
% parheat2D: 2차원 열 방정식(2차원 포물선 PDE)의 풀이
% (d/dt)u(t,x,y) = alpha*[(d/dx)(d/dx)u(t,x,y) + (d/dy)(d/dy)u(t,x,y)]
% 0 < t <= tf, 0 < x < a, 0 < y < b

% 초기조건: u(0,x,y) = f(x,y), 경계조건: u(t,x,y) = g(t,x,y)
% Inputs:
%   tf: 최종시간, a: x의 상한, b: y의 상한, m: 시간간격 수, n: x간격 수, p: y간격 수
%   alpha: 열 방정식 계수, f: 초기조건 함수, g: 경계조건 함수
% Outputs:
%   x: 격자점 벡터(nx1), y: 격자점 벡터(px1), U: nxp 행렬(U(i,j) = u(T,x(i),y(j)))

A1 = zeros(3,p); A2 = zeros(3,n); Q1 = zeros(3,p); Q2 = zeros(3,n);
W = zeros(n,p); c1 = zeros(p,1); c2 = zeros(n,1); v2 = zeros(p,1);
x = zeros(n,1); y = zeros(p,1); U = zeros(n,p);
dt = tf/m; dx = a/(n+1); dy = b/(p+1); gx = alpha*(dt/2)/(dx*dx); gy =alpha*(dt/2)/(dy*dy);
for i = 1:n, x(i) = i*dx; end; for j = 1:p, y(j) = j*dy; end; g0 = 1 +2*gy;
for i = 1:p, A1(1,i) = -gy; A1(2,i) = g0; A1(3,i) = -gy; end
[Q1,delt] = facm(A1);
if abs(delt) < eps/100, disp('삼각대각 계수행렬은 singular.'); return; end
g0 = 1 + 2*gx;
for i = 1:n, A2(1,i) = -gx; A2(2,i) = g0; A2(3,i) = -gx; end
[Q2,delt] = facm(A2);
if abs(delt) < eps/100, disp('삼각대각 계수행렬은 singular.'); return; end
for i = 1:n
    for j = 1:p, U(i,j) = f(x(i),y(j)); end
end
for k = 0:m-1
    t0 = k*dt; t1 = (k+1)*dt; tm = (t0 + t1)/2; g0 = 1 - 2*gx;
    for j = 1:p, c1(j) = g0*U(1,j) + gx*U(2,j); c1(j) = c1(j) + gx*g(t0,0,y(j));
    end
    c1(1) = c1(1) + gy*g(tm,x(1),0); c1(p) = c1(p) + gy*g(tm,x(1),b);
    [v2,delt] = linsol(Q1,c1); W(1,1:p) = v2';
    for i = 2:n-1 % First pass: 1 < i < n
        for j = 1:p, c1(j) = gx*U(i-1,j) + g0*U(i,j) + gx*U(i+1,j); end
        c1(1) = c1(1) + gy*g(tm,x(i),0); c1(p) = c1(p) + gy*g(tm,x(i),b);
        [v2,delt] = linsol(Q1,c1); W(i,1:p) = v2';
    end
    for j = 1:p % i = n
        c1(j) = gx*U(n-1,j) + g0*U(n,j); c1(j) = c1(j) + gx*g(t0,a,y(j));
    end
    c1(1) = c1(1) + gy*g(tm,x(n),0); c1(p) = c1(p) + gy*g(tm,x(n),b);
    [v2,delt] = linsol(Q1,c1); W(n,1:p) = v2';
    g0 = 1 - 2*gy; % j = 1
    for i = 1:n, c2(i) = g0*W(i,1) + gy*W(i,2); c2(i) = c2(i) + gy*g(t0,x(i),0); end
    c2(1) = c2(1) + gx*g(t1,0,y(1)); c2(n) = c2(n) + gx*g(t1,a,y(1));
    [U(1:n,1),delt] = linsol(Q2,c2);

    for j = 2:p-1 % 1 < j < p
        for i = 1:n, c2(i) = gy*W(i,j-1) + g0*W(i,j) + gy*W(i,j+1); end
        c2(1) = c2(1) + gx*g(t1,0,y(j)); c2(n) = c2(n) + gx*g(t1,a,y(j));
        [U(1:n,j),delt] = linsol(Q2,c2);
    end
    for i = 1:n, c2(i) = gy*W(i,p-1) + g0*W(i,p); c2(i) = c2(i) + gx*g(tm,x(i),b); end % j =p
    c2(1) = c2(1) + gx*g(t1,0,y(p)); c2(n) = c2(n) + gx*g(t1,a,y(p));
    [U(1:n,p),delt] = linsol(Q2,c2);
end
end

function [Q,delt] = facm(T)
% nxn 행렬 T를 삼각요소들로 분해, delt: T의 행렬값
crit = eps/100; delt = 1; [m,n] = size (T); Q = zeros(3,n);
Q(3,1:n-1) = T(3,1:n-1); Q(2,1) = T(2,1);
for k = 1:n-1
    delt = delt*Q(2,k);
    if abs(Q(2,k)) < crit, delt = 0; return;
    else, Q(1,k) = T(1,k)/Q(2,k); Q(2,k+1) = T(2,k+1) - T(3,k)*Q(1,k); end
end
delt = delt*Q(2,n);
end

function [x,delt] = linsol(Q,b)
% 삼각대각 선형시스템 Ax = b의 풀이
crit = eps/100; delt = 1; [m,n] = size(Q);
for k = 1:n
    delt = delt*Q(2,k); if abs(delt) < crit, delt = 0; return; end
end
y = zeros(n,1); y(1) = b(1)/Q(2,1); for k = 2:n, y(k) = (b(k) - Q(3,k-1)*y(k-1))/Q(2,k); end
x = zeros(n,1); x(n) = y(n); for k = n-1:-1:1, x(k) = y(k) - Q(1,k)*x(k+1); end
end