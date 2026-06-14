% lottop.m
xj = 1:9; mj = [17 32 21 28 9 11 24 15 18];
m = sum(mj); % 데이터 값들의 합
pxj = mj/m; % 발생확률
Pr6 = sum(trapz(xj(1:6), pxj(1:6))); % Pr(X<=x6)
mux = sum(xj.*pxj); % 기댓값
xbar = sum(xj)/length(xj); % 모우드
sig2 = sum((xj-mux).^2)/length(xj); % 분산
sig = sqrt(sig2); % 표준편차
avgx = sum(xj)/length(xj); % 평균
s2 = sum((xj - avgx).^2)/(length(xj)-1); % 샘플의 분산
display('발생확률: '), pxj
fprintf('기댓값: %g, 모우드: %g, 분산: %g\\n', mux, xbar, sig2);
fprintf('표준편차: %g, 평균: %g, 샘플의 분산: %g\n', sig, avgx, s2);
