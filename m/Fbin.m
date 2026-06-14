function [fm,xm,iter] = Fbin(fun,a,b,tol)
% Fibonacci 탐색방법
% input:
% fun: 사용자 정의 비선형 함수
% [a b]: 초기 탐색범위, tol: tolerance
% output:
% xm: 함수의 최적점, fm: 함수의 최소값

Fb(1) = 1; Fb(2) = 1; n = 2;
while(Fb(n) <= (b-a)/tol)
    n = n+1; Fb(n) = Fb(n-1) + Fb(n-2);
end
c = b - (b-a)*Fb(n-1)/Fb(n); d = a + (b-a)*Fb(n-1)/Fb(n);
fc = feval(fun, c); fd = feval(fun, d);
for k = n:-1:3
    if(fc <= fd)
        b = d; d = c; fd = fc; c = a + (b-a)*Fb(k-2)/Fb(k); fc = feval(fun, c);
    else
        a = c; c = d; fc = fd; d = a + (b-a)*Fb(k-1)/Fb(k); fd = feval(fun, d);
    end
end
xm = (a + b)/2; fm = feval(fun, xm); iter = n;
end