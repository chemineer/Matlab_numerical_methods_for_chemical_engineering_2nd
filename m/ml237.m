x = [0.9 1.9 2.6 3.9 4.7 6 8 10.5 11.6 12.4];
y = [1.3 1.8 2.6 2.4 2.1 2.3 2.3 1.4 0.7 0.6];
xi = min(x):0.1:max(x);
y3 = spline(x,y,xi);
plot(xi,y3,x,y,'o'), xlabel('x'), ylabel('y')
legend('3차 spline 안점작','데이터','location','best'), grid
