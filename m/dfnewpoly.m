function [P, df] = dfnewpoly(x, y)
% Input:
% x, y: 각각 독립변수 및 종속변수 데이터 벡터
% Output:
% P: n차 Newton 다항식의 계수들을 포함하는 벡터, df: x(1)에서의 미분의 근사값
P = y; n = length(x);
for j = 2:n
    for k = n:-1:j, P(k) = (P(k) - P(k-1))/(x(k) - x(k-j+1)); end
end
x1 = x(1); df = P(2); pdn = 1; m = length(P) - 1;
for k = 2:m, pdn = pdn*(x1 - x(k)); df = df + pdn*P(k+1); end