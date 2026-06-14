function [x,fx,k] = gsroot(f,a,b,crit,kmax)
if f(a)*f(b) > 0, error('구간 [a b]는 해를 포함하지 않거나 너무 넓음.'); end
tau = (sqrt(5)-1)/2;
for k = 1:kmax
    fa = f(a); fb = f(b); I = b-a; t = a + tau*I; ft = f(t);
    if fa*ft < 0, b = t;
    else, a = t;
    end
    if abs(b-a) < crit, break; end
end
x = t; fx = ft;
end
