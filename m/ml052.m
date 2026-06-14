g1 = @(x) 1+1/x; g2 = @(x) x^2-1; g3 = @(x) sqrt(x+1); x0 = 0.1; tol= 1e-6;
[x1, iter1] = sucsub(g1,x0,tol)

[x2, iter2] = sucsub(g2,x0, tol)

[x3, iter3] = sucsub(g3,x0, tol)

