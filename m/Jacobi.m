function x = Jacobi(A, c, x0, tol)
% Jacobi 반복법에 의한 선형 대수방정식 Ax=c의 풀이
% input:
%   A: 계수 행렬
%   c: 상수항 벡터
%   x0: 초기 가정값 벡터
%   tol: 수렴성 테스트 기준.

% 초기화
if nargin < 4 | isempty(tol), tol = 1e-6; end
if nargin >= 4 & tol == 0, tol = 1e-6; end
c = c(:); % 열 벡터임을 확인
x0 = x0(:); % 열 벡터임을 확인
n = length(c); [nr nc] = size(A);
% 계수행렬, 상수항 벡터, 그리고 미지수 벡터를 확인
if nr ~= nc, error('계수행렬은 정방행렬이 아님.'); end
if nr ~= n, error('계수행렬과 상수항 벡터의 길이가 다름.'); end
if length(x0) ~= n, error('미지수 벡터와 상수항 벡터의 길이가 다름.'); end

% 계수행렬이 비정칙(singular)임을 확인
if det(A) == 0, fprintf('\nRank = %7.3g\n', rank(A)); error('계수행렬은 singular.'); end

% 수정된 계수행렬과 계수벡터를 갱신
D = diag(diag(A)); % 대각행렬
a0 = inv(D)*A - eye(n); % 수정된 계수행렬
c0 = inv(D)*c; % 수정된 상수항 벡터
x = x0; x0 = x + 2*tol; iter = 0;

% 대입과정
while max(abs(x - x0)) >= tol, x0 = x; x = c0 - a0*x0; end