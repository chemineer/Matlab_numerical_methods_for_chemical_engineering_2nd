function [y u] = FredTrap(fx,kxt,a,b,n)
% Trapezoidal 규칙을 이용한 Fredholm 적분방정식의 풀이
% fx: 함수 f(x), kxt: 커널 k(x,t), [a b]: 적분구간, n: 소구간 수
Inl = eye(n+1); h = (b-a)/n;
for i = 1:n+1
    v(i) = h; x = a + (i-1)*h; F(i) = feval(fx,x);
    for j = 1:n+1, t = a + (j-1)*h; K(i,j) = feval(kxt,x,t); end
end
v(1) = h/2; v(n+1) = h/2; D = diag(v); M = Inl + K*D; f = F';
u = inv(M)*f; y = [a:h:b]';
end