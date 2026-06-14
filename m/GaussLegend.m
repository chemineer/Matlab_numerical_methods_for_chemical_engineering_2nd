function Q = GaussLegend(fcn, a, b, h, n, varargin)
% n-point Gauss-Legendre 구적법에 의한 함수 fcn의 적분
% a, b: 적분의 하한 및 상한, h: 적분구간(h=b-a)

% 입력인수 체크
if nargin < 4 || isempty(h) || abs(b - a) < abs(h), h = b - a; end
if nargin < 5 || isempty(n) || n < 2, n = 2; end
if sign(h) ~= sign(b-a), h = -h; end
n = fix(n);

% Legendre 다항식의 계수
for k = 0:n/2
    cl(2*k+1) = (-1)^k * gamma(2*n - 2*k + 1) / ...
        (2^n * gamma(k + 1) * gamma(n - k + 1) * gamma(n - 2*k + 1));
    if k < n/2, cl(2*k+2) = 0; end
end

z = roots(cl); % Legendre 다항식의 근

% 가중치
for p = 1 : n
    B = [1 0]; k = 0; denom = 1; A(1) = B(1);
    % Legendre 다항식의 계수들의 벡터를 구성
    for q = 1 : n
        if q ~= p
            k = k + 1;
            for r = 2 : k+1, A(r) = B(r) - B(r-1) * z(q); end % 계수벡터
            denom = denom * (z(p) - z(q));
        end
        B = [A 0];
    end
    
    % Legendre 다항식의 적분의 계수벡터
    for k = 1:n, Ai(k) = A(k) / (n - k + 1); end
    Ai(n + 1) = 0;
    w(p) = (polyval(Ai, 1) - polyval(Ai, -1)) / denom; % 가중치 Wi
    clear A
end

Q = 0;
% 적분을 수행
for x = a:h:b-h

    for p = 1:n, xp = x + (z(p) + 1)*h/2; Q = Q + w(p)*feval(fcn, xp, varargin{:})*h/2; end
end
% 나머지 구간의 적분 ((b-a)/h가 정수가 아닌 경우)
xr = x + h; hr = b - (x + h);
if hr > 0
    for p = 1:n, xp = xr + (z(p) + 1)*hr/2; Q = Q + w(p)*feval(fcn, xp, varargin{:})*hr/2; end
end
end