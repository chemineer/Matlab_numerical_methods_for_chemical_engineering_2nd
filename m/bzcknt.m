function y = bzcknt(k,n)
% bzcknt.m: Bezier 곡선 (B_kn(t), t는 symbol 변수)
syms t;
c = factorial(n)/(factorial(k)*factorial(n-k));
y = c*t^k*(1-t)^(n-k);
end