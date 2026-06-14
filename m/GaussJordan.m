function x = GaussJordan(A,c)
% Gauss-Jordan 방법을 이용한 선형대수방정식 Ax=c의 풀이
% A: 계수행렬
% c: 상수 벡터
c = c(:);  % c가 열 벡터임을 확인
n = length(c); [nr nc] = size(A);
% 계수행렬과 상수벡터의 차원을 확인
if nr ~= nc, error('계수행렬이 정방행렬이 아님.'); end
if nr ~= n, error('계수행렬과 상수벡터의 길이가 서로 같지 않음.'); end
% 상수행렬이 singular인지를 조사
if det(A) == 0, fprintf('\nRank = %7.3g\n',rank(A)); error('상수행렬은 singular이다.'); end
unit = diag(ones(1, n)); % 항등행렬
order = [1:n]; % 미지수의 차원
aug = [A c]; % 확장행렬
% Gauss-Jordan 축소 알고리즘
for k = 1:n
    pivot = abs(aug(k, k)); prow = k; pcol = k;
    % 최대 피벗 원소를 찾음
    for row = k:n
        for col = k:n
            if abs(aug(row, col)) > pivot
                pivot = abs(aug(row, col)); prow = row; pcol = col;
            end
        end
    end
    % 행들을 교환
    pr = unit; tmp = pr(k, :); pr(k, :) = pr(prow, :); pr(prow, :) = tmp;
    aug = pr*aug;

% 열들을 교환
pc = unit; tmp = pc(k, :); pc(k, :) = pc(pcol, :); pc(pcol, :) = tmp;
aug(1:n, 1:n) = aug(1:n, 1:n)*pc; order = order*pc;
% 대각선 상하의 원소들을 0으로 만든다.
lk = unit;
for m = 1:n
    if m == k, lk(m, k) = 1/aug(k, k);
    else, lk(m, k) = -aug(m, k)/aug(k, k);
    end
end
aug = lk*aug;
end
x = zeros(n, 1);
% 해
for k = 1:n, x(order(k)) = aug(k, n+1); end