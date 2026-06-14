function [x,iter] = Laguer(f,x0)
% Laguerre 방법을 이용한 다항 방정식의 풀이
% f: 다항식 계수벡터(행벡터)
% x0: 해의 초기 가정값

epsf = 1e-6; n = length(f) - 1; iter = 1; maxiter = 100;
if n == 1, x = -f(2)/f(1); return; end
f0 = polyval(f,x0); q1 = polyder(f); q2 = polyder(q1);
for k = 1:maxiter
    f1 = polyval(q1,x0); f2 = polyval(q2,x0); g = f1^2 - n*f0*f2/(n-1);
    d1 = f1 + (n-1)*sqrt(g); d2 = f1 - (n-1)*sqrt(g);
    if (abs(d1) >= abs(d2)), x1 = x0 - n*f0/d1;
    else, x1 = x0 - n*f0/d2; end
    x0 = x1; f0 = polyval(f,x0);
    if (abs(f0) <= epsf) || (k >= maxiter), x = x1; return; end
end
x = x1; iter = k;
end