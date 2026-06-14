f = @(x) x.^3 - 3*x + 2; df = @(x) 3*x.^2 - 3;
x0 = -2.4; delta = 1e-6; crit = 1e-6; maxiter = 1e3;
[x,z] = stfac(f,df,-2.4,delta,crit,maxiter)
