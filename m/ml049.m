f = @(x) 8-4.5*(x-sin(x)); a=2; b= 3; tol= 1e-6;
[x, iter] = falsepos(f,a,b, tol)
