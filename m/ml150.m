A = [10 4 1; 4 6 0; 1 0 2]; b = [1 2 3]';
x = pcg(A,b)

%x = minres(A,b)

x = bicg(A,b)

x = gmres(A,b)

x = qmr(A,b)

x = A\b
