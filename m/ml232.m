x = [0 9.7 15.6 21.3 31.7 35.2 38.4 42.9];
y = [0 0.28 0.524 0.998 1.695 2.306 2.781 3.205];
xi = min(x):0.1:max(x); y2 = qdspintp(x,y,xi); y3 = cspline(x,y,xi);
plot(xi,y2,':',xi,y3,x,y,'o'), xlabel('유량'), ylabel('압력강하')
legend('2차 spline 안점작','3차 spline 안점작','데이터','location','best'), grid
