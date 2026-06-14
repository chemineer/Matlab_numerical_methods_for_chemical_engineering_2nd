function [y u] = FredGN(fx,kxt,a,b,n)
% Gauss-Nystrom 방법을 이용한 Fredholm 적분방정식의 풀이
% fx: 함수 f(x), kxt: 커널 k(x,t), [a b]: 적분구간, n: 소구간 수
if n == 4
    z(1) = -sqrt(1/7*(3 - 4*sqrt(0.3))); z(2) = -sqrt(1/7*(3 + 4*sqrt(0.3)));
    z(3) = -z(1); z(4) = -z(2); w(1) = 1/2 + 1/12*sqrt(10/3);
    w(2) = 1/2 - 1/12*sqrt(10/3); w(3) = w(1); w(4) = w(2);
end
if n == 5
    z(1) = -sqrt(1/9*(5 - 2*sqrt(10/7))); z(2) = -sqrt(1/9*(5 + 2*sqrt(10/7)));
    z(3) = 0; z(4) = -z(1); z(5) = -z(2);
    w(1) = 0.3*(( -0.7 + 5*sqrt(0.7))/(-2 + 5*sqrt(0.7)));
    w(2) = 0.3*((0.7 + 5*sqrt(0.7))/(2 + 5*sqrt(0.7)));
    w(3) = 128/225; w(4) = w(1); w(5) = w(2);
end
In = eye(n);
for i = 1:n
    x = ((b-a)*z(i)+a+b)/2; y(i) = x; F(i) = feval(fx,x);
    for j = 1:n, t = ((b-a)*z(j)+a+b)/2; K(i,j) = (b-a)/2*feval(kxt,x,t)*w(j); end
end
M = In + K; f = F'; u = inv(M)*F';
end