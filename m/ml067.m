fun = @(x) 2*exp(-x)-x; x0 = 0; tol = 1e-6; [x, iter] = secant(fun, x0, tol)
