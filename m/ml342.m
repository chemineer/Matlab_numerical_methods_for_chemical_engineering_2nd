% odemidp.m: example of midpoint method
dyt = @(t,y) -3*y/5 + 3.8*exp(0.7*t); ti = 0; tf = 5; y0 = 2;
h1 = 0.01; [t1,y1] = midp(dyt,ti,tf,h1,y0);
h2 = 0.1; [t2,y2] = midp(dyt,ti,tf,h2,y0);
h3 = 1; [t3,y3] = midp(dyt,ti,tf,h3,y0);

plot(t1,y1,t2,y2,':',t3,y3,'-.'), grid, legend('h=0.01','h=0.1','h=1'),
xlabel('t'), ylabel('y')
