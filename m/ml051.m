Re = 8e4; eD = 1.5e-4; fun = @(x) 1/(-.86*log(eD/3.7+2.51/Re/sqrt(x)))^2;
x0 = 0.1; tol = 1e-6; [x, iter] = sucsub(fun,x0,tol)
