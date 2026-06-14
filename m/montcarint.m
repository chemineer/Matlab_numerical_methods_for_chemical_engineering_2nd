function y = montcarint(a,b,n,f)
% montcarint.m: Monte Carlo 방법을 이용한 f(x)의 적분 수행
% Inputs:
%   a: 적분 하한(mx1 벡터), b: 적분 상한(mx1 벡터)
%   (적분구간은 D = {x: a(k)<=x(k)<=b(k), 1<=k<=m})
%   n: 피적분 함수 추정에 이용되는 랜덤수들의 갯수
%   f: 적분되는 함수
% Outputs:
%   y: 근사 적분값
m = length(a); x = zeros(m,1); y = 0;
Ad = prod(b - a);
for i = 1:n
    for j = 1:m, x(j) = a(j) + (b(j) - a(j))*rand(1,1); end
    y = y + f(x);
end
y = y*Ad/n;
end