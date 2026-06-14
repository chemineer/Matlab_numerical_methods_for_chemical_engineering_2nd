function [x y] = AdamsBash(fun,a,b,y0,h,m)
% Adams-Bashforth 방법을 이용한 미분방정식의 풀이
% fun: 미분방정식 (y'=fun(x,y), y(a)=y0)
% [a b]: 적분구간, y0: 초기조건, h: 소구간 너비
% m: AB 방법의 스텝 수(차수) (m = 2, 3, 혹은 4)

n = (b-a)/h; x = a:h:b+h; y(1) = y0;
% 4차 Runge-Kutta로 시작
for i = 1:m-1
    k1 = feval(fun,x(i),y(i)); k2 = feval(fun,x(i)+h/2,y(i)+h*k1/2);
    k3 = feval(fun,x(i)+h/2,y(i)+h*k2/2); k4 = feval(fun,x(i)+h,y(i)+h*k3);
    y(i+1) = y(i) + h*(k1 + 2*k2 + 2*k3 + k4)/6;
end
if m == 4 % 4-스텝 AB
    for i = m:n
        f1 = feval(fun,x(i),y(i)); f2 = feval(fun,x(i-1),y(i-1));
        f3 = feval(fun,x(i-2),y(i-2)); f4 = feval(fun,x(i-3),y(i-3));
        y(i+1) = y(i) + h*(55*f1 - 59*f2 + 37*f3 - 9*f4)/24;
    end
elseif m == 3 % 3-스텝 AB
    for i = m:n
        f1 = feval(fun,x(i),y(i)); f2 = feval(fun,x(i-1),y(i-1));
        f3 = feval(fun,x(i-2),y(i-2));
        y(i+1) = y(i) + h*(23*f1 - 16*f2 + 5*f3)/12;
    end
else % m = 2: 2-스텝 AB
    for i = m:n
        f1 = feval(fun,x(i),y(i)); f2 = feval(fun,x(i-1),y(i-1));
        y(i+1) = y(i) + h*(3*f1 - f2)/2;
    end
end
end