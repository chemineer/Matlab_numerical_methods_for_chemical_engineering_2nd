f1 = @(x) x.*(1-x); f2 = @(x) 0*x; g1 = @(t) 0*t; g2 = @(t) 0*t;
a = 1; tf = 1; n = 10; m = 20; uv = hypimp(f1,f2,g1,g2,tf,n,m,a)
