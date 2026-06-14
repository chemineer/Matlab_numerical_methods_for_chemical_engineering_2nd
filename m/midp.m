function [x,y] = midp(odefun,xi,xf,h,yi,varargin)
% 중간점 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, h: 구간 길이, yi: y의 초기값 벡터(xi에서의 함수값)

% 초기화
if isempty(h) | h == 0, h = (xf - xi)/99; end
yi = (yi(:).'); 
x = [xi:h:xf]; % x 값들의 벡터
if x(end) ~= xf, x(end+1) = xf; end
d = diff(x); y(:,1) = yi; ym(:,1) = yi;
for i = 1:length(x)-1
    fi = feval(odefun,x(i),y(:,i),varargin{:}); xm = (x(i)+x(i+1))/2; ym(:,i) = y(:,i) + d(i)*fi/2;
    fm = feval(odefun,xm,ym(:,i),varargin{:}); y(:,i+1) = y(:,i) + d(i)*fm;
end
end