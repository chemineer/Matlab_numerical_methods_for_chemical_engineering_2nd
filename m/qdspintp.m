function yi = qdspintp(x,y,xi)
% n개 데이터를 이용한 2차 spline 안점작 계산

% input:
% x: n개 독립변수 데이터
% y: n개 종속변수 데이터
% xi: 안점작을 계산할 독립변수
% output:
% yi: xi에서 계산된 안점작 종속변수값

m = length(xi); n = length(x);
if length(y) ~= n, error('x와 y의 길이는 같아야 함.'); end
ni = n-1; % spline 함수들의 수(=구간수)
% 초기화
a = zeros(1,n); b = zeros(1,n); c = zeros(1,n); h = zeros(1,ni); yi = zeros(1,m);
for i = 1:ni, a(i) = y(i); h(i) = x(i+1)-x(i); end
c(1) = 0; b(1) = (y(2) - y(1))/h(1); b(2) = b(1);
% spline 계수들의 계산
for k = 2:ni
    c(k) = (y(k+1) - y(k) - b(k)*h(k))./(h(k).^2); b(k+1) = b(k) + 2*c(k)*h(k);
end
for k = 1:m
    for j = 1:ni
        if (xi(k) >= x(j)) & (xi(k) <= x(j+1))
            yi(k) = a(j) + b(j)*(xi(k)-x(j)) + c(j)*(xi(k) - x(j)).^2;
        break;
        end
    end
end