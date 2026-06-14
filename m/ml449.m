f1 = @(x) x.*(1-x); f2 = @(x) 0*x; xf = 1; tf = 1; c = 1; n = 10; m = 20;
zu = hyppdeex(f1,f2,c,xf,tf,n,m);
