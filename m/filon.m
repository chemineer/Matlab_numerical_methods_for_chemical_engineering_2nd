function fint = filon(fun,m,k,a,b,n)
% Filon 방법에 의한 f(x)*cos(kx) 혹은 f(x)*sin(kx)의 적분
% fun: f(x)
% m: 삼각함수 인식자(m=1: cos(kx)*f(x) 적분, m~=1: sin(kx)*f(x) 적분)
% k: cos(kx) 혹은 sin(kx)에서의 k 값
% a, b: 적분의 하한 및 상한

% n: 구간 수
% fint: 계산된 적분결과

if (n/2) ~= floor(n/2), disp('n은 짝수여야 함.'); return;
else
    h = (b - a)/n; q = k*h; q2 = q*q; q3 = q2*q;
    if q < 0.1
        A = 2*q2*(q/45 - q3/315 + q2*q3/4725);
        B = 2*(1/3 + q2/15 + 2*q2*q2/105 + q3*q3/567);
        D = 4/3 - 2*q2/15 + q2*q2/210 - q3*q3/11340;
    else
        A = (q2 + q*sin(2*q)/2 - 2*(sin(q))^2)/q3;
        B = 2*(q*(1+(cos(q))^2) - sin(2*q))/q3;
        D = 4*(sin(q) - q*cos(q))/q3;
    end
    x = a:h:b; y = feval(fun,x); yodd = y(2:2:n); yeven = y(3:2:n-1);
    if m == 1
        c = cos(k*x); codd = c(2:2:n); ceven = c(3:2:n-1);
        co = codd*yodd'; ce = (y(1)*c(1) + y(n+1)*c(n+1))/2 + ceven*yeven';
        fint = h*(A*(y(n+1)*sin(k*b)-y(1)*sin(k*a))+B*ce+D*co);
    else
        s = sin(k*x); sodd = s(2:2:n); seven = s(3:2:n-1);
        so = sodd*yodd'; se = (y(1)*s(1) + y(n+1)*s(n+1))/2 + seven*yeven';
        fint = h*(-A*(y(n+1)*cos(k*b)-y(1)*cos(k*a))+B*se+D*so);
    end
end
end