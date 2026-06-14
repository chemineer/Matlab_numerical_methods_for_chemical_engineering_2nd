% lintemp: 선형회귀에 의한 온도분포 직선식의 계산
clear all;
t = [1 2 3 4 5 6]; T = [49.8 55.4 54.1 56.8 60.5 58.6]; n = length(t);
a1 = (n*sum(t.*T) - sum(t)*sum(T))/(n*sum(t.^2)-(sum(t)^2)), a0 = mean(T) - a1*mean(t)
yT = a0 + a1*t; % 직선식에 의한 온도
plot(t,yT,t,T,'o'), title('반응온도'), xlabel('시간(hr)'), ylabel('온도(C)')
