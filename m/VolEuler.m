function [y u] = VolEuler(fx,kxt,a,b,n)
% Euler 규칙을 이용한 Volterra 적분방정식의 풀이
% fx: 함수 f(x), kxt: 커널 k(x,t), [a b]: 적분구간, n: 소구간 수
h = (b-a)/n; u(1) = feval(fx,a);
for i = 2:n+1
    x = a + (i-1)*h; F = feval(fx,x); s = 0;
    for j = 1:i-1, t = a + (j-1)*h; s = s + u(j)*h*feval(kxt,x,t); end
    u(i) = F + s;
end
y = [a:h:b]';
end