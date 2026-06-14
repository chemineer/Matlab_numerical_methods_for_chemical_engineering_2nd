% impeuler.m: 암묵적 Euler 방법을 이용한 비선형 미분방정식의 풀이
ti = 0; tf = 0.5; h = 0.002; y0 = 2000; n = (tf - ti)/h; y(1) = y0; t(1) = ti;
for k = 1:n
    t(k+1) = t(k) + h; z = y(k);
    for j = 1:20 % Newton 방법을 이용한 비선형 방정식의 풀이
        num = z + 0.8*h*z^1.5 - 10*y0*h*(1 - exp(-3*t(k+1))) - y(k);
        den = 1 + 1.2*h*sqrt(z); zn = z - num/den;
        if abs((zn - z)/z) < 1e-4, break; else, z = zn; end
    end
    if j == 20, fprintf('t=%g s에서 수치해를 구할 수 없음.',t(k)); break; end
    y(k+1) = zn;
end
plot(t,y), grid, axis([0 0.5 0 2000]), xlabel('t(s)'), ylabel('y(t)')

