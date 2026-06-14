function x = GaussElm(A,c)
% Gauss 소거법에 의한 선형방정식 시스템 Ax=c의 풀이

c = c(:);  % c가 열벡터임을 확인
n = length(c); [nr nc] = size(A);
% 계수행렬과 상수 벡터를 조사
if nr ~= nc, error('계수행렬이 정방행렬이 아님.'); end
if nr ~= n, error('계수행렬과 상수벡터의 길이가 서로 다름.'); end
% 계수행렬이 특이행렬인지를 조사
if det(A) == 0, fprintf('\n Rank = %7.3g\n',rank(A)); error('계수행렬이 특이행렬 임.'); end
unit = diag(ones(1, n)); % 단위행렬
order = [1:n]; % 미지수들의 차수
aug = [A c]; % 확장행렬
% Gauss 소거
for k = 1:n-1
    pivot = abs(aug(k, k)); prow = k; pcol = k;
    % 최대 pivot 원소 규명
    for row = k:n
        for col = k:n
            if abs(aug(row, col)) > pivot,
                pivot = abs(aug(row, col)); prow = row; pcol = col;
            end
        end
    end
    % 행들을 교환
    pr = unit; tmp = pr(k, :); pr(k, :) = pr(prow, :); pr(prow, :) = tmp;
    aug = pr*aug;
    % 열들을 교환
    pc = unit; tmp = pc(k, :); pc(k, :) = pc(pcol, :); pc(pcol, :) = tmp;
    aug(1:n, 1:n) = aug(1:n, 1:n)*pc; order = order * pc;
    % k번째 열에서 대각선 아래의 모든 원소들을 0으로 만든다.
    lk = unit;
    for m = k+1:n, lk(m, k) = -aug(m, k)/aug(k, k); end
    aug = lk*aug;
end
x = zeros(n, 1);
% Back substitution
t(n) = aug(n, n+1)/aug(n, n); x(order(n)) = t(n);
for k = n-1:-1:1
    t(k) = (aug(k,n+1) - sum(aug(k,k+1:n).*t(k+1:n)))/aug(k,k); x(order(k)) = t(k);
end