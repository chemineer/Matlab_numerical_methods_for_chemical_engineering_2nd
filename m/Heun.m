function [x,y] = Heun(odefun,xi,xf,h,yi,varargin)
% Heun 방법에 의한 ODE의 풀이
% odefun: 미분방정식
% xi, xf: 적분구간
% h: 구간 길이
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)

% 초기화
if isempty(h) | h == 0, h = (xf - xi)/99; end
yi = (yi(:).'); x = [xi:h:xf]; % x 값들의 벡터

if x(end) ~= xf, x(end+1) = xf; end
d = diff(x); % x의 증가분 벡터
y(:,1) = yi; yp(:,1) = yi;
for i = 1:length(x)-1
    fi = feval(odefun,x(i),y(:,i),varargin{:}); yp(:,i+1) = y(:,i) + d(i)*fi;
    fp = feval(odefun,x(i+1),yp(:,i+1),varargin{:}); y(:,i+1) = y(:,i) + d(i)*(fi + fp)/2;
end
end