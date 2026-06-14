Re= 8e4; eD= 1.5e-4; fun = @(x) 1/sqrt(x) + 0.86*log(eD/3.7 + 2.51/Re/sqrt(x));
x0 = 0.01; tol= 1e-6; [x, iter] = newtonrap (fun, x0, tol)
