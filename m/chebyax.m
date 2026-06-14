function [c,x,y] = chebyax(f,n,a,b)
% input:
%   f: 근사되는 함수(문자열로 입력), n: 다항식의 차수, a,b: 구간의 하한과 상한
% Output:
%   c: 다항식의 계수, x,y: 좌표
if nargin == 2, a = -1; b = 1; end % default 구간은 [-1,1]
d = pi/(2*n+2); c = zeros(1,n+1);
for k = 1:n+1, x(k) = cos((2*k-1)*d); end
x = (b-a)*x/2 + (a+b)/2; y = f(x);
for k = 1:n+1
    z = (2*k-1)*d;
    for j = 1:n+1, c(j) = c(j) + y(k)*cos((j-1)*z); end
end
c = 2*c/(n+1); c(1) = c(1)/2;
end