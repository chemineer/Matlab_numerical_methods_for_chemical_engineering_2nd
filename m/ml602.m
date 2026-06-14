n = 10; tol = 1e-8; A = 10*rand(n); b = 10*rand(n,1); ada = A*A';
sol = lincg(ada,b,n,tol)
