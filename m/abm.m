function [x,y] = abm(odefun,xi,xf,h,yi,varargin)

% Adams-Bashforth-Moulton 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, h: 구간 길이
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)

% 초기화
if isempty(h) | h == 0, h = (xf - xi)/99; end
yi = (yi(:).')'; x = [xi:h:xf]';  % Vector of x values
if x(end) ~= xf, x(end+1) = xf; end
d = diff(x); % x 값들의 벡터
[a,b] = RungeKutta(odefun,x(1),x(4),h,yi,4,varargin{:});
y(:,1:4) = b; c1 = y(:,1); p1 = y(:,1); % Predictor, Corrector의 초기화
for i = 1:4, f(:,i) = feval(odefun,x(i),y(:,i),varargin{:}); end

% Adams-Moulton 방법에 의한 풀이
for i = 4:length(x)-1
    c0 = c1; p0 = p1;
    % Predictor
    y(:,i+1) = y(:,i) + d(i)/24 * (55*f(:,i) - 59*f(:,i-1) + 37*f(:,i-2) - 9*f(:,i-3));
    p1 = y(:,i+1); f(:,i+1) = feval(odefun,x(i+1),y(:,i+1),varargin{:});
    % Modifier
    m = p1 + (c0 - p0)*251/270; fm = feval(odefun,x(i+1),m,varargin{:});
    % Corrector
    y(:,i+1) = y(:,i) + d(i)/24 * (9*fm + 19*f(:,i) - 5*f(:,i-1) + f(:,i-2));
    c1 = y(:,i+1); y(:,i+1) = c1 - (c1 - p1)*19/270;
    f(:,i+1) = feval(odefun,x(i+1),y(:,i+1),varargin{:});
end
end
