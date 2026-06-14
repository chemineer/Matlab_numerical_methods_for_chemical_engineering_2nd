function [u,x,y] = helpde(f,g,qx0,qxf,qy0,qyf,R,m,n,crit,kmax)
% Helmholtz 방정식의 풀이: u_xx + u_yy + g(x,y)u(x,y) = f(x,y)
% 풀이영역 R = [x0 xf y0 yf]
% 경계조건: u(x0,y) = qx0(y), u(xf,y) = qxf(y), u(x,y0) = qy0(x), u(x,yf) = qyf(x)
% m: x 축에 따른 소구간들의 수, n: y 축에 따른 소구간들의 수
% crit: 수렴한계, kmax: 최대 반복계산 횟수
x0 = R(1); xf = R(2); y0 = R(3); yf = R(4);
dx = (xf - x0)/m; x = x0 + [0:m]*dx;
dy = (yf - y0)/n; y = y0 + [0:n]*dy;
dx2 = dx*dx; dy2 = dy*dy; dxy2 = 2*(dx2 + dy2);
bx = dx2/dxy2; by = dy2/dxy2; bxy = bx*dy2;
m1 = m + 1; n1 = n + 1;
% 경계조건
for k = 1:n1, u(k,[1 m1]) = [qx0(y(k)) qxf(y(k))]; end % at x=x0 and x=xf
for k = 1:m1, u([1 n1], k) = [qy0(x(k)) qyf(x(k))]; end % at y=y0 and y=yf
% 초기화
u(2:m,2:n) = 0;
for i = 1:m
    for j = 1:n, fv(i,j) = f(x(i),y(j)); gv(i,j) = g(x(i),y(j)); end
end
% 연속치환 방법에 의한 차분방정식의 풀이
for k = 1:kmax % 반복계산을 수행
    for i = 2:m
        for j = 2:n
            u(i,j) = by*(u(i+1,j)+u(i-1,j)) + bx*(u(i,j+1)+u(i,j-1)) + ...
            bxy*(gv(i,j)*u(i,j)-fv(i,j));
        end
    end
    if k>1 & max(max(abs(u-u0)))<crit, break; end
    u0 = u; % 역치환
end
end