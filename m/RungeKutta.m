function [x,y] = RungeKutta(odefun,xi,xf,h,yi,n,varargin)
% Runge-Kutta 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, h: 구간 길이
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)
% n: Runge-Kutta 방법의 차수(2~5) (default: 2(2차 Runge-Kutta 방법))

% 초기화
if isempty(h) | h == 0, h = (xf - xi)/99; end
if nargin == 5 | isempty(n) | n < 2 | n > 5, n = 2; end
n = fix(n); yi = (yi(:).'); % 열벡터임을 확인
x = [xi:h:xf]; % x값들의 벡터
if x(end) ~= xf, x(end+1) = xf; end
d = diff(x); y(:,1) = yi; % 초기조건
switch n
case 2 % 2차 Runge-Kutta
    for i = 1:length(x)-1
        k1 = d(i) * feval(odefun,x(i),y(:,i),varargin{:});
        k2 = d(i) * feval(odefun,x(i+1),y(:,i)+k1,varargin{:}); y(:,i+1) = y(:,i) + (k1+k2)/2;
    end
case 3 % 3차 Runge-Kutta
    for i = 1:length(x)-1
        k1 = d(i) * feval(odefun,x(i),y(:,i),varargin{:});
        k2 = d(i) * feval(odefun,x(i)+d(i)/2,y(:,i)+k1/2,varargin{:});
        k3 = d(i) * feval(odefun,x(i+1),y(:,i)+2*k2-k1,varargin{:});
        y(:,i+1) = y(:,i) + (k1+4*k2+k3)/6;

    end
    case 4 % 4차 Runge-Kutta
        for i = 1:length(x)-1
            k1 = d(i) * feval(odefun,x(i),y(:,i),varargin{:});
            k2 = d(i) * feval(odefun,x(i)+d(i)/2,y(:,i)+k1/2, varargin{:});
            k3 = d(i) * feval(odefun,x(i)+d(i)/2,y(:,i)+k2/2, varargin{:});
            k4 = d(i) * feval(odefun,x(i+1),y(:,i)+k3,varargin{:});
            y(:,i+1) = y(:,i) + (k1+2*k2+2*k3+k4)/6;
        end
    case 5 % Butcher의 5차 Runge-Kutta
        for i = 1:length(x)-1
            k1 = d(i) * feval(odefun,x(i),y(:,i),varargin{:});
            k2 = d(i) * feval(odefun,x(i)+d(i)/2,y(:,i)+k1/2, varargin{:});
            k3 = d(i) * feval(odefun,x(i)+d(i)/4,y(:,i)+3*k1/16+k2/16, varargin{:});
            k4 = d(i) * feval(odefun,x(i)+d(i)/2,y(:,i)+k3/2, varargin{:});
            k5 = d(i) * feval(odefun,x(i)+3*d(i)/4,y(:,i)-3*k2/16+6*k3/16+9*k4/16,varargin{:});
            k6 = d(i) * feval(odefun,x(i+1),y(:,i)+k1/7+4*k2/7+6*k3/7-12*k4/7+8*k5/7,varargin{:});
            y(:,i+1) = y(:,i) + (7*k1+32*k3+12*k4+32*k5+7*k6)/90;
        end
    end
end