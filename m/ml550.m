% frplot.m: Fourier 수열의 그래프(1-3항)
t = -2:0.01:2; y1 = 4*cos(pi*t)/pi; y2 = -4*cos(3*pi*t)/pi/3; y3 = 4*cos(5*pi*t)/pi/5;
plot(t,y1,':',t,y2,'--',t,y3,'-.',t,y1+y2+y3,'-'), xlabel('t'), ylabel('f(t)'), grid
legend('y1=4cos(wt)/pi','y2=-4cos(3wt)/3pi','y3=4cos(5wt)/5pi','f(t)=y1+y2+y3')
