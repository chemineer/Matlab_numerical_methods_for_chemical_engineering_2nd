% parpde2dm
a = 4; b = 4; m = 20; n = 19; p = 19; tf = 1.e4; alpha = 1.0e-4;
f = @(t,x,y) 0; g = @(t,x,y) exp(y)*cos(x) - exp(x)*cos(y);
dt = tf/m; dx = a/(n+1); dy = b/(p+1); gx = alpha*dt/(dx*dx); gy = alpha*dt/(dy*dy);
[x,y,U] = parheat2D(tf,a,b,m,n,p,alpha,f,g);
mesh(x,y,U), xlabel('x'), ylabel('y'), zlabel('U')
