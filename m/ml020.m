% appsine.m % sine 함수의 근사
clc;
c = {'b', 'g','r','c'}; % 그래프 선 색상
x= linspace(-pi,pi,200); y= zeros(size(x)); hold on
for k = 0:3, y = y + ((-1)^k*x.^(2*k+1))/(factorial(2*k+1)); plot(x,y, c(k+1)); end
plot(x,sin(x), 'k'), grid, title('다양한 차수에 따른 Taylor 급수근사')
xlabel('x'), ylabel('y'), axis tight, hold off, grid on
legend('1차','3차','5차','7차', 'Analytic', 'location', 'best')
