x0 = 0; tol = 1e-6; fun = @(x) 2*exp(-x); [x, iter] = wegstein(fun,x0,tol)
