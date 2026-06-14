% odeabm.m: Adams-Bashforth-Moulton method
dyt = @(t,y) 2*y*sin(t) + 3*y*exp(-0.5*t) - y + 1; ti = 0; tf = 5; yi = 2;
h1 = 0.01; [t1,y1] = abm(dyt,ti,tf,h1,yi);

h2 = 0.1; [t2,y2] = abm(dyt,ti,tf,h2,yi);
h3 = 1; [t3,y3] = abm(dyt,ti,tf,h3,yi);
plot(t1,y1,t2,y2,':',t3,y3,'-.'), grid, legend('h=0.01','h=0.1','h=1'),
xlabel('t'), ylabel('y')
