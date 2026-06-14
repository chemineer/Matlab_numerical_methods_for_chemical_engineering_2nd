function [x y] = rkfode(f,a,b,y0,m,crit)
% Input:
% f: 미분식, a와 b: 적분구간의 하한 및 상한, y0: 초기값
% m: 적분구간 수, crit: 수렴한계
% Output:

% y: x에 따른 근사해 y(x)

a2 = 0.25; a3 = 3/8; a4 = 12/13; a5 = 1; a6 = 0.5;
b2 = 0.25; b3 = 3/32; b4 = 1932/2197; b5 = 439/216; b6 = -8/27;
c3 = 9/32; c4 = -7200/2197; c5 = -8; c6 = 2;
d4 = 7296/2197; d5 = 3680/513; d6 = -3544/2565;
e5 = -845/4104; e6 = 1859/4104; f6 = -11/40;
r1 = 1/360; r3 = -128/4275; r4 = -2197/75240; r5 = 1/50; r6 = 2/55;
n1 = 25/216; n3 = 1408/2565; n4 = 2197/4104; n5 = -1/5;
bignum = 1e15; h = (b-a)/m; hmin = h/64; hmax = 64*h; maxi = 200;
y(1) = y0; x(1) = a; bv = b - (1e-5)*abs(b); j = 1;
while (x(j) < b)
    if ((x(j)+h) > bv), h = b - x(j); end
    k1 = h*f(x(j),y(j)); y2 = y(j) + b2*k1;
    if bignum < abs(y2), break; end
    k2 = h*f(x(j)+a2*h,y2); y3 = y(j) + b3*k1 + c3*k2;
    if bignum < abs(y3), break; end
    k3 = h*f(x(j)+a3*h,y3); y4 = y(j) + b4*k1 + c4*k2 + d4*k3;
    if bignum < abs(y4), break; end
    k4 = h*f(x(j)+a4*h,y4); y5 = y(j) + b5*k1 + c5*k2 + d5*k3 + e5*k4;
    if bignum < abs(y5), break; end
    k5 = h*f(x(j)+a5*h,y5); y6 = y(j) + b6*k1 + c6*k2 + d6*k3 + e6*k4 + f6*k5;
    if bignum < abs(y6), break; end
    k6 = h*f(x(j)+a6*h,y6); err = abs(r1*k1 + r3*k3 + r4*k4 + r5*k5 + r6*k6);
    ynew = y(j) + n1*k1 + n3*k3 + n4*k4 + n5*k5;
    if (err<crit | h<2*hmin)
        y(j+1) = ynew;
        if (x(j)+h > bv), x(j+1) = b; else, x(j+1) = x(j) + h; end
        j = j + 1;
    end
    if err == 0, s = 0;
    else, s = 0.84*(crit*h/err)^(1/4); end
    if (s < 0.75) & (h > 2*hmin), h = h/2; end
    if (s > 1.5) & (2*h < hmax), h = 2*h; end
    if ((bignum < abs(y(j))) | (maxi == j)), break; end
    m = j;
    if b > x(j), m = j+1; else, m = j; end
end
x = x'; y = y';
end