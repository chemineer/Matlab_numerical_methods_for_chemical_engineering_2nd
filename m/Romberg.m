function Q = Romberg(fun,a,b,n)
% Romberg quadrature에 의한 적분의 수행
% fun: 함수 이름, [a b]: 적분구간, n: 소구간 수
h = b - a; R(1,1) = h*(feval(fun,a) + feval(fun,b))/2; m = 1;
for i = 1:n-1
    h = h/2; s = 0;
    for j = 1:m, x = a + h*(2*j - 1); s = s + feval(fun,x); end
    R(i+1,1) = R(i,1)/2 + h*s; m = 2*m;
    for k = 1:i, R(i+1,k+1) = R(i+1,k) + (R(i+1,k) - R(i,k))/(4^k - 1); end
end
Q = R(i+1,k+1);
end