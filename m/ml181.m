maxiter = 1e3; tol = 1e-6; A = [42 -32 21 -11; 43 -33 22 -11; 2 -2 2 -1; 0.2 -0.2 0.2 0];
[z m] = maxeig(A,maxiter,tol)
