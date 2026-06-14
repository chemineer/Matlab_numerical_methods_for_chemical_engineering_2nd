% solnonde.m: Euler 방법을 이용한 비선형 미분방정식의 풀이
xi = 0; xf = 2.5; h = 0.1; yi = 3;
dy = @(x,y) -1.2*y + 7*exp(-0.3*x); % 미분방정식의 정의
[x,y] = Euler(dy,xi,xf,h,yi); % Explicit Euler 방법
xv = 0:0.01:2.5; yr = 70*exp(-0.3*xv)/9 - 43*exp(-1.2*xv)/9; % 엄밀해
plot(x,y,xv,yr,':'), grid, xlabel('x'), ylabel('y'), title('h=0.1'), legend('Euler 방법','엄밀해')

