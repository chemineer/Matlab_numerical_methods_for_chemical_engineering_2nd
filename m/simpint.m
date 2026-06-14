function y = simpint(a,b,n,f)
% Simpson 방법에 의한 적분
% Inputs:
%   a,b: 적분의 하한 및 상한, n: 패널 수(>=2, 짝수), f: 피적분 함수
h = (b - a)/n; y = f(a) + f(b);
for i = 1:n-1
    if mod(i,2), y = y + 4*f(a+i*h); else, y = y + 2*f(a+i*h); end
end
y = h*y/3;
end