function [xv,yv] = trapode(odefun,xi,xf,h,yi)
% Trapezoidal 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, h: 소구간 크기
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)

nh = (xf-xi)/h + 1; y = yi; x = xi; yv = yi; xv = xi;
for i = 2:nh
    y1 = y + h*feval(odefun,x,y); x1 = x + h; k = 0; diffy = 1;
    while abs(diffy) > 1e-3
        k = k + 1; y2 = y + h*(feval(odefun,x,y) + feval(odefun,x1,y1))/2;
        diffy = y1 - y2; y1 = y2;
    end
    xv = [xv, x1]; yv = [yv, y1]; x = x1; y = y1;
end
end