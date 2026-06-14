A = [4 -2 0; -2 6 -5; 0 -5 11]; b = [8 -29 43]';
w = 1.2; x0 = [0 0 0]'; tol = 1e-6; kmax = 100; [x,iter] = sucor(A,b,x0,w,tol,kmax)
