function [x,y] = Collocation(odefun,x0,xf,y0,yf,guess,n,rho,tol,varargin)
% Orthogonal collocation 방법을 이용한 경계치 문제의 풀이
% Inputs:
% x0, xf: 적분구간
% n: orthogonal collocation 방법의 차수
% odefun: 미분방정식 시스템
% rho: relaxation factor
% tol: 수렴테스트 기준치
% y0, yf, gamma: 초기조건, 경계조건, 초기가정값들의 벡터
% Outputs:
% x: 독립변수 벡터
% y: 종속변수 행렬

% 초기화
if nargin < 7 | isempty(n), n = 1; end
if nargin < 8 | isempty(rho), rho = 1; end
if nargin < 9 | isempty(tol), tol = 1e-6; end
y0 = (y0(:)); % 열벡터임을 확인
yf = (yf(:)); % 열벡터임을 확인
guess = (guess(:)); % 열벡터임을 확인
% 가정하는 값들의 수를 체크
if length(yf) ~= length(guess), error('가정하는 조건들의 수가 최종 조건들의 수와 다름.');
end
r = length(y0); % 초기조건들의 수
m = r + length(yf); % 경계조건들의 수
% 식의 수를 조사
ftest = feval(odefun,x0,[y0 ; guess],varargin{:});
if length(ftest) ~= m, error('식의 수와 경계조건들의 수가 다름.'); end
% Legendre 다항식의 계수
for k = 0 : n/2
    cl(2*k+1) = (-1)^k*gamma(2*n-2*k+1)/(2^n*gamma(k+1)*gamma(n-k+1)*gamma(n-2*k+1));
    if k < n/2, cl(2*k+2) = 0; end
end
zl = roots(cl); % Legendre 다항식의 근
z = [-1; sort(zl); 1]; % Collocation 점(z)
x = (xf-x0)*z/2+(xf+x0)/2; % Collocation 점(x)

% 종속변수들의 초기값 벡터를 구축
[p,q] = RungeKutta(odefun,x0,xf,(xf-x0)/20,[y0 ; guess],2,varargin{:});
for k = 1:m, y(k,:) = spline(p,q(k,:),x'); end
y(r+1:m,end) = yf(1:m-r);

% 행렬 A를 구축
Q(:,1) = ones(n+2,1); C(:,1) = zeros(n+2,1);
for i = 1:n+1, Q(:,i+1) = x.^i; C(:,i+1) = i*x.^(i-1); end
A = C*inv(Q);
for k = 1:m
    k1 = (k-1)*(n+2)+1; k2 = k1 + n+1;
    Am(k1:k2,k1:k2) = A; % 행렬 Am을 구축
    Y(k1:k2) = y(k,:);   % 벡터 Y를 구축
end
Y = Y'; % 열벡터로 전환
Y1 = Y * 1.1; iter = 0; maxiter = 100;
F = zeros(m*(n+2),1); Fa = zeros(m*(n+2),1); dY = zeros(m*(n+2),1);
position = []; % 경계조건들을 제외한 Collocation 점
for k = 1:m
    if k <= r, position = [position, (k-1)*(n+2)+[2:n+2] ];
    else, position = [position, (k-1)*(n+2)+[1:n+1] ];
    end
end
% Newton 방법
while max(abs(Y1 - Y)) > tol & iter < maxiter
    iter = iter + 1; Y1 = Y;
    % 벡터 F를 구축
    for k = 1:n+2
        F(k:n+2:(m-1)*(n+2)+k) = feval(odefun,x(k),Y(k : n+2 : (m-1)*(n+2)+k),varargin{:});
    end
    fnk = Am * Y - F;
    % 미분을 위한 dY를 설정
    for k = 1:m*(n+1)
        if Y(position(k)) ~= 0, dY(position(k)) = Y(position(k)) / 100;
        else, dY(position(k)) = 0.01;
        end
    end
    % Jacobian 행렬의 계산
    for k = 1:m
        for kk = 1:n+1
            a = Y; nc = (k-1)*(n+1)+kk; a(position(nc)) = Y(position(nc)) + dY(position(nc));
            for kkk = 1:n+2
            Fa(kkk:n+2:(m-1)*(n+2)+kkk) = ...
            feval(odefun,x(kkk),a(kkk:n+2:(m-1)*(n+2)+kkk),varargin{:});
        end
        fnka = Am*a - Fa; jacob(:,nc) = (fnka(position) - fnk(position))/dY(position(nc));
    end
end
% 근을 근사
if det(jacob) == 0, Y(position) = Y(position) + max([abs(dY(position)), 1.1*tol]);
else, Y(position) = Y(position) - rho * inv(jacob) * fnk(position);
end
end
% y 값들을 재배열
for k = 1:m, k1 = (k-1)*(n+2)+1; k2 = k1 + n+1; y(k,:) = Y(k1:k2)'; end
x = x';
if iter >= maxiter, disp('Warning : Maximum iterations reached.'); end
end