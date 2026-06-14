function [x, iter] = secant(fun,x0,tol,varargin)
% Secant 방법에 의한 방정식의 풀이
% input:
% x0: 초기값(열 벡터), fun: 방정식
% output:
% x: 해, iter: 반복계산 횟수

xn = x0*1.1; % x(n)
if xn == x0, xn = x0 + 0.1; end
xn1 = x0; % x(n-1)
iter = 0; maxiter = 100;
while max(abs(xn - xn1)) > tol && iter < maxiter % 반복계산 루프
    iter = iter + 1; fn1 = feval(fun,xn1,varargin{:}); % f(x(n-1))
    fn = feval(fun,xn,varargin{:}); % f(x(n))


    x = (xn1.*fn - xn.*fn1)./(fn - fn1); xn1 = xn; xn = x;
end
if iter >= maxiter, disp('경고: 허용 가능한 최대 반복계산 횟수에 도달.'); end
end
