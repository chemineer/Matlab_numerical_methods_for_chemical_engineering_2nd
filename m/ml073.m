crit = 1e-6; a = 0; b = 2; kmax = 1000; f = @(x) 2*exp(-x) - x;
[x,f,k] = gsroot(f,a,b,crit,kmax)
