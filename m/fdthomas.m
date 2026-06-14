function [xv yv] = fdthomas(p,q,r,xa,xb,n,ya,yb)
% fdthomas.m: Thomas 방법에 의한 유한차분 삼각대각 선형방정식 시스템의 풀이
% 경계치 문제: y'' = p(x)y' + q(x)y + r(x), y(xa)=ya, y(xb)=yb
% input:
%   p,q,r: 소구간 점 x에서의 p(x), q(x), r(x) 값을 나타내는 벡터
%   xa, xb: 독립변수 구간의 하한 및 상한값
%   n: 소구간 수
%   ya, yb: xa 및 xb에서의 종속변수 값(경계치)
% outout:
%   xv: 독립변수 구간점
%   yv: 독립변수 구간점에서의 해

h = (xb - xa)/n; hs = h*h;
x = linspace(xa+h, xb, n); % 독립변수 구간점 x(1), ..., x(n-1)
% 대각성분들의 정의
a = zeros(1,n-1); a(1:n-2) = 2 - p(1,1:n-2)*h; d = -(4 + 2*hs*q);
b = zeros(1,n-1); b(2:n-1) = 2 + p(1,2:n-1)*h;
% 우변벡터
c(1) = 2*hs*r(1) - (2 + p(1)*h)*ya; c(2:n-2) = 2*hs*r(2:n-2);
c(n-1) = 2*hs*r(n-1) - (2 - p(n-1)*h)*yb;
% Thomas 알고리즘

m = length(d); a(1) = a(1)/d(1); c(1) = c(1)/d(1);
for i = 2:m-1
    den = d(i) - b(i)*a(i-1);
    if (den == 0), error('분모가 0.'); end
    a(i) = a(i)/den; c(i) = (c(i) - b(i)*c(i-1))/den;
end
c(m) = (c(m) - b(m)*c(m-1))/(d(m) - b(m)*a(m-1)); y(m) = c(m);
for i = m-1:-1:1, y(i) = c(i) - a(i)*y(i+1); end
xv = [xa x]; yv = [ya y yb];
end
