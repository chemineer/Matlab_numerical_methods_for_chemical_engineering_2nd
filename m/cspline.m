function yi = cspline(x,y,xi)
% Cubic spline에 의한 1차원 안점작 계산
% 벡터 xi에서 함수값 yi를 계산
% x, y: 데이터 벡터

% 초기화
if nargin < 3, error('Invalid number of inputs.'); end
% x, xi와 y는 열벡터
x = (x(:).'); y = (y(:).'); xi = (xi(:).'); nx = length(x); ny = length(y);
if nx ~= ny, error('X and Y vectors are not the same size.'); end
lxi = length(xi);
for m = 1:lxi
    d = xi(m) - x; [dm, loc(m)] = min(abs(d));
    if d(loc(m)) < 0 || loc(m) == nx, loc(m) = loc(m) - 1; end
    if loc(m) < 1, loc(m) = 1; end
end
dx = diff(x); dy = diff(y); yox = dy ./ dx;
% 행렬의 계수
A = 2*diag(x(3:nx)-x(1:nx-2)) + [zeros(nx-2,1) [diag(dx(2:nx-2)); zeros(1,nx-3)]] + ...
    [zeros(1,nx-2); [diag(dx(2:nx-2)) zeros(nx-3,1)]];
% 상수들의 벡터
c = 6*(yox(2:nx-1) - yox(1:nx-2))';		%주의
% 선형방정식 시스템의 해
y2 = [0; inv(A)*c; 0];
y2 = y2'								%주의
% 안점작 계산
yi = (1/6) * ((xi - x(loc+1)).^3 ./ (x(loc) - x(loc+1)) ...
    - (x(loc) - x(loc+1)) .* (xi - x(loc+1))) .* y2(loc) ...
    + (1/6) * ((xi - x(loc)).^3 ./ (x(loc+1) - x(loc)) ...
    - (x(loc+1) - x(loc)) .* (xi - x(loc))) .* y2(loc+1) ...
    + (xi - x(loc+1)) ./ (x(loc) - x(loc+1)) .* y(loc) ...
    + (xi - x(loc)) ./ (x(loc+1) - x(loc)) .* y(loc+1);
end