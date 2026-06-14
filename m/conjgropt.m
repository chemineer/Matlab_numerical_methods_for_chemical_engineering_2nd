function [xs,fs,k] = conjgropt(f,gf,hf,x0,crit)
% Input:
% x0: 초기점, f: 목적함수, gf: 목적함수의 gradient, hf: 목적함수의 Hessian
% crit: 수렴한계
% Output:
% xs: 최적점, fs: 최적점에서의 목적함수 값, k: 반복계산 횟수
k = 1; xk = x0; gk = gf(xk); Hk = hf(xk);
dk = -gk; g2 = gk'*gk; ak = g2/(dk'*Hk*dk); adk = ak*dk; erm = norm(adk);
while erm >= crit
    xk = xk + adk; gk = gf(xk); Hk = hf(xk);
    g2new = gk'*gk; bk = g2new/g2; dk = -gk + bk*dk; g2 = g2new;
    ak = g2/(dk'*Hk*dk); adk = ak*dk; erm = norm(adk); k = k + 1;
end
xs = xk + adk; fs = f(xs);
end