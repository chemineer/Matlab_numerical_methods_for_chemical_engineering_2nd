% expleuler.m: explicit Euler method
dyt = @(t,y) -3*y/5 + 3.8*exp(0.7*t); ti = 0; tf = 5; y0 = 2;
n1 = 500; [t1,y1] = expEuler(dyt,ti,tf,n1,y0);
n2 = 50; [t2,y2] = expEuler(dyt,ti,tf,n2,y0);
n3 = 5; [t3,y3] = expEuler(dyt,ti,tf,n3,y0);
plot(t1,y1,t2,y2,':',t3,y3,'-.'), grid, xlabel('t'), ylabel('y'), legend('n=500','n=50','n=5')

