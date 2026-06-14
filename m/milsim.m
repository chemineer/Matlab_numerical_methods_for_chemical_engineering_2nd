function [x,y] = milsim(f,x,y)
% Input:
% f: 미분방정식, x,y: 독립 및 종속변수 초기값 벡터(4개 데이터)
% Output:
% x,y: 근사해 계산결과
n = length(x); if n < 5, return; end
g = zeros(1,4); g = f(x(1:4),y(1:4)); h = x(2) - x(1); pold = 0; yold = 0;
for k = 4:n-1
    pnew = y(k-3) + (4*h/3)*(g(2:4)*[2 -1 2]'); % 예측자(predictor)
    pmod = pnew + 28*(yold - pold)/29; % 수정자(modifier)
    x(k+1) = x(1) + h*k; g = [g(2) g(3) g(4) f(x(k+1),pmod)];
    y(k+1) = y(k-1) + (h/3)*(g(2:4)*[1 4 1]'); % 보정자(corrector)
    pold = pnew; yold = y(k+1); g(4) = f(x(k+1),y(k+1));
end
x = x'; y = y';
end