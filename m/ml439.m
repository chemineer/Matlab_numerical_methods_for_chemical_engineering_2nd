f = @(x) x.^4; g0 = @(t) 0*t; g1 = @(t) t.^0;
xf = 1; tf = 0.2; n = 5; m = 5; a = 1; z = rodtempim(f,g0,g1,xf,tf,n,m,a)
