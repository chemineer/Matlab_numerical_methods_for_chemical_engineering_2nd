f = @(x) x^3- 2*x + 1;
[x,fv,re,iter] = bisec(f,-2,2,1e-6,1000)
