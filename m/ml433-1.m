f0 = @(x) x.^2; f1 = @(x) 1; g0 = @(y) y.^2; g1 = @(y) 1; f = @(x,y) 0;
n = 20; m = 20; iter = 40; u = poisson(f,f0,f1,g0,g1,n,m,iter);
