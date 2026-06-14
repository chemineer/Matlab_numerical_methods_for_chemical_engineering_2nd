function x = GaussSeidel(A, b, x0, tol)
% Gauss-Seidel 반복법에 의한 선형 대수방정식 Ax=b의 풀이
% input:
%   A: 계수 행렬
%   b: 상수항 벡터
%   x0: 초기 가정값 벡터
%   tol: 수렴성 테스트 기준.

% 초기화
itmax = 500;
if nargin < 4 | isempty(tol), tol = 1e-6; end
if nargin >= 4 & tol == 0, tol = 1e-6; end
b = b(:); % 열 벡터임을 확인
x0 = x0(:); % 열 벡터임을 확인
n = length(b); [nr nb] = size(A);
% 계수행렬, 상수항 벡터, 그리고 미지수 벡터를 확인
if nr ~= nb, error('계수행렬은 정방행렬이 아님.'); end
if nr ~= n, error('계수행렬과 상수항 벡터의 길이가 다름.'); end
if length(x0) ~= n, error('미지수 벡터와 상수항 벡터의 길이가 다름.'); end
% 계수행렬이 비정칙(singular)임을 확인
if det(A) == 0, fprintf('\nRank = %7.3g\n', rank(A)); error('계수행렬은 singular.'); end

% 수정된 계수행렬과 계수벡터를 갱신
Au = [A b]; x = zeros(n,1); y = zeros(n,1); y = x0;
for k = 1:itmax+1
    for i = 1:n

    s = 0;
    for j = 1:i-1, s = s + A(i,j)*x(j); end
    for j = i+1:n, s = s + A(i,j)*x0(j); end
    if (A(i,i) == 0), break; end
    x(i) = (-s+b(i))/A(i,i);
end
err = abs(norm(x-x0)); rerr = err / (norm(x) + eps); x0 = x; y = [y x];
if (rerr < tol), break; end
end
if (k == itmax+1), disp('수렴되지 않음.');
else, fprintf('반복계산 횟수: %d\n',k); end
end