function [x,y] = Adams(odefun,xi,xf,h,yi,varargin)
% Adams 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, h: 구간 길이
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)

% 초기화
if isempty(h) | h == 0, h = (xf - xi)/99; end
yi = (yi(:).'); x = [xi:h:xf]'; % x 값들의 벡터
if x(end) ~= xf, x(end+1) = xf; end
d = diff(x);
% 시작점
[a,b] = RungeKutta(odefun,x(1),x(3),h,yi,3,varargin{:}); y(:,1:3) = b;
for i = 1:3, f(:,i) = feval(odefun,x(i),y(:,i),varargin{:}); end
% Adams 방법에 의한 풀이
for i = 3:length(x)-1
    y(:,i+1) = y(:,i) + d(i)/12 * (23*f(:,i) - 16*f(:,i-1) + 5*f(:,i-2));
    f(:,i+1) = feval(odefun,x(i+1),y(:,i+1),varargin{:});
end
end