function [xs,fs] = simanopt(f,x0,lb,ub,kmax,q,tolf)
% Simulated annealing 방법을 이용한 f(x)의 최소화 (l <= x <= u)
N = length(x0); x = x0; fx = f(x); xs = x; fs = fx;
for k = 0:kmax
    Ti = (k/kmax)^q; mu = 10^(Ti*100);
    w = 2*rand(size(x)) - 1;
    dx = (((1 + mu).^abs(w) - 1)/mu).*sign(w).*(ub - lb);
    x1 = x + dx; x1 = (x1<lb).*lb + (lb<=x1).*(x1<=ub).*x1 + (ub<x1).*ub;
    fx1 = f(x1); df = fx1 - fx;
    if df < 0 | rand < exp(-Ti*df/(abs(fx) + eps)/tolf)
        x = x1; fx = fx1;
    end
    if fx < fs, xs = x; fs = fx1; end
end