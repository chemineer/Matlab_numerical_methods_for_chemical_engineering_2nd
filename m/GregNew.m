function yi = GregNew(x,y,xi,n)
% GregoryNewton 방법에 의한 선형(1차원) 안짐작 계산
% 벡터 xi에서의 함수 y의 함수값 yi를 계산
% 입력데이터:
% x,y: 주어진 데이터(독립변수, y: 종속변수)
% n: n차의 Gregory-Newton forward 안짐작
% xi: 함수값을 알고자 하는 종속변수 벡터
% 출력값:
% yi: 벡터 xi에서의 함수의 함수값

% 초기화
if nargin < 3, error('입력인수가 부족.'); end
% 데이터의 간격이 균일한지를 조사하고 구간(간격) h를 결정
if min(diff(x)) ~= max(diff(x)), error('독립변수 간격이 균일하지 않음.');
else, h = x(2) - x(1); end
% x와 y가 열벡터임을 확인
x = (x(:).')'; y = (y(:).')'; nx = length(x); ny = length(y);
if nx ~= ny, error('X, Y 벡터의 크기가 다름.'); end
if nargin == 3 | n < 1, n = 1; end % 안짐작 차수

n = floor(n);
if n >= nx
    fprintf('\n%2d-차 안짐작을 수행하기에는 데이터 수가 부족.',n)
    fprintf('\n여기에서는 %2d-차 안짐작을 수행.\n',nx-1); n = nx - 1;
end
deltax(1,1:length(xi)) = ones(1,length(xi));
% 필요한 수만큼 기준점들을 배치
for m = 1:length(xi)
    dx = xi(m) - x; [dxm , loc(m)] = min(abs(dx));
    if dx(loc(m)) < 0, loc(m) = loc(m) - 1; end
    if loc(m) < 1, loc(m) = 1; end
    if loc(m)+n > nx, loc(m) = nx - n; end
    deltax(2:n+1,m) = dx(loc(m):loc(m)+n-1); ytemp(1:n+1,m) = y(loc(m):loc(m)+n);
end
% 안짐작 계산을 수행
yi = y(loc)';
for k = 1:n, yi = yi + prod(deltax(1:k+1,:)) .* diff(ytemp(1:k+1,:),k) / (gamma(k+1) * h^k); end
end