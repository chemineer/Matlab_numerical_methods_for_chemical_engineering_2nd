f = @(x) x.^4; g0 = @(t) 0*t; g1 = @(t) t.^0;
xf = 1; tf = 0.1; n = 5; m = 5; a = 1; z = rodtemp(f,g0,g1,xf,tf,n,m,a)
