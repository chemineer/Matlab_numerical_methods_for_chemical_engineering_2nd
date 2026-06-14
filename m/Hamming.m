function [xv,yv] = Hamming(odefun,xi,xf,h,yi)
% Hamming 방법에 의한 ODE의 풀이
% odefun: 미분방정식
% xi, xf: 적분구간
% h: 구간 길이
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)

% 초기화
od = 4; b = [1/6 1/3 1/3 1/6]; d = [0 1/2 1/2 1];
c = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];
nh = (xf-xi)/h + 1; y = yi; yv = yi; x = xi; xv = xi;
fv(1) = feval(odefun,x,y); ys(1) = yi;
for j = 2:4
    k(1) = h*feval(odefun,x,y);
    for i = 2:od, k(i) = h*feval(odefun,x+h*d(i),y+c(i,1:i-1)*k(1:i-1)'); end
    y1 = y + b*k'; ys(j) = y1; x1 = x + h; fv(j) = feval(odefun,x1,y1);
    xv = [xv, x1]; yv = [yv, y1]; x = x1; y = y1;
end
for i = 5:nh % Hamming 방법의 적용
    yl = ys(1) + 4*h*(2*fv(4) - fv(3) + 2*fv(2))/3; x1 = x + h; ylm = yl;
    if i > 5, ylm = yl + 112*(c - p)/121; end
    fv(5) = feval(odefun,x1,ylm); yc = (9*ys(4) - ys(2) + 3*h*(2*fv(4)+fv(5)-fv(3)))/8;
    ycm = yc + 9*(yl - yc)/121; p = yl; c = yc;
    fv(5) = feval(odefun,x1,ycm); fv(2:4) = fv(3:5);
    ys(1:3) = ys(2:4); ys(4) = ycm; xv = [xv, x1]; yv = [yv, ycm]; x = x1;
end
end