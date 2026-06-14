fun = @(x) 2*exp(-x)-x; x0 = 0; tol= 1e-6; [x, iter] = newtonrap (fun, x0, tol)

