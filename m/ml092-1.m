f = @(x) [x(1)^2+x(2)^2-4; x(1)*x(2)-1]; x0 = [3 -1.5]'; tol = 1e-5;
[x,iter] = broyden(f,x0,tol)
