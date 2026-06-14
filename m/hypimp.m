function uv = hypimp(f1,f2,g1,g2,tf,n,m,a)
% hypimp: Implicit 방법에 의한 hyperbolic PDE의 풀이
% input:
%   f1, f2: 초기조건, g1, g2: 경계조건, tf: 시간구간
%   n,m: x 및 t에 대한 소구간 수, a: 방정식 파라미터
% output:
%   uv: 계산결과
h = 1/n; k = tf/m; % x 방향구간 및 시간구간 길이
r = (a*k/h)^2; q = 2*(1 + r);
x = h:h:h*(n-1); t = k:k:k*m; % x 방향 및 시간 격자점들의 생성
d = 2*(1+r)*ones(1,n-1); a = -r*ones(1,n-2); a(n-1) = 0;
b = -r*ones(1,n-1); b(1) = 0; [dv, bv] = LUtrid(a,d,b);
w00 = feval(f1,0); wx0 = feval(f1,x); wa0 = feval(f1,1);
dw00 = feval(f2,0); dwx0 = feval(f2,x); dwa0 = feval(f2,1);
w0t = feval(g1,t); wat = feval(g2,t);
% 첫 번째 시간구간에서의 풀이

cv(1,1) = 2*wx0(1) - r*k*(dw00 + dwx0(2)) + q*k*dwx0(1) + r*w0t(1);
cv(1,2:n-2) = 2*wx0(2:n-2) - r*k*(dwx0(1:n-3) + dwx0(3:n-1)) + q*k*dwx0(2:n-2) + r*w0t(1);
cv(1,n-1) = 2*wx0(n-1) - r*k*(dwx0(n-2) + dwa0) + q*k*dwx0(n-1) + r*wat(1);
x = solLUtrid(a,dv,bv,cv); w(1:n-1,1) = x(1:n-1)';
% 두 번째 시간구간에서의 풀이
cv(1,1) = 4*w(1,1) + r*(w00 + wx0(2)) - q*wx0(1) + r*w0t(2);
cv(1,2:n-2) = 4*w(2:n-2,1)' + r*(wx0(1:n-3) + wx0(3:n-1)) - q*wx0(2:n-2);
cv(1,n-1) = 4*w(n-1,1) + r*(wx0(n-2) + wa0) - q*wx0(n-1) + r*wat(2);
x = solLUtrid(a,dv,bv,cv); w(1:n-1,2) = x(1:n-1)';
% 시간구간: j=3,4,...
for j = 3:m
    cv(1,1) = 4*w(1,j-1) + r*(w0t(j-2) + w(2,j-2)) - q*w(1,j-2) + r*w0t(j);
    cv(1,2:n-2) = 4*w(2:n-2,j-1)' + r*(w(1:n-3,j-2)' + w(3:n-1,j-2)') - q*w(2:n-2,j-2)';
    cv(1,n-1) = 4*w(n-1,j-1) + r*(w(n-2,j-2) + wat(j-2)) - q*w(n-1,j-2) + r*wat(j);
    x = solLUtrid(a,dv,bv,cv); w(1:n-1,j) = x(1:n-1)';
end
% 풀이결과
zv = w'; zv = [w0t' zv wat']; wv = [w00 wx0 wa0];
uv = [wv; zv]; tv = 0:k:tf; xv = 0:h:1;
mesh(xv,tv,uv), xlabel('x'), ylabel('t'), zlabel('u')
end
%---------------------------------------------------------
function [D,B] = LUtrid(a,d,b) % LU 분해
n = length(d); B(1) = 0; D(1) = d(1);
for i = 2:n, B(i) = b(i)/D(i-1); D(i) = d(i) - B(i)*a(i-1); end
end
%---------------------------------------------------------
function x = solLUtrid(a,d,b,r) % 선형시스템 Ax=LUx=r의 풀이
n = length(d); z(1) = r(1);
for i = 2:n, z(i) = r(i) - b(i)*z(i-1); end
x(n) = z(n)/d(n);
for i = n-1:-1:1, x(i) = (z(i) - a(i)*x(i+1))/d(i); end
end