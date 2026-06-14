function c = lspolyfit(X,Y,m)
% m차 다항식에 의한 데이터 접합
% X,Y: 1xn 데이터 벡터, m: 다항식의 차수
% c: 다항식의 계수 벡터
n = length(X); b = zeros(1:m+1); f = zeros(n,m+1);
for k = 1:m+1, f(:,k) = X'.^(k-1); end
a = f'*f; b = f'*Y'; c = a\b; c = flipud(c); % c를 위아래로 뒤집는다.
end