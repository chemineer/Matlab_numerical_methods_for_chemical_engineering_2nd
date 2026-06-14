% trigmreg.m: 삼각함수를 이용한 데이터 접합
clear all;
ti = [0 2 4 6 8]*pi/5; yi = [0 3 2 0 -1]; N = length(yi); % 데이터의 수
A0 = sum(yi)/N, A1 = 2*sum(yi.*cos(ti))/N, B1 = 2*sum(yi.*sin(ti))/N
tm = 0:0.01:7; ym = A0 + A1*cos(tm) + B1*sin(tm); % 모델
plot(tm,ym,ti,yi,'o'), grid, legend('삼각함수 접합', '데이터')
