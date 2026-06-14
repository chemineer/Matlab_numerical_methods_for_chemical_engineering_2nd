a = 0; b = 3; n = 300; ya = 0.1; yb = 0.1*exp(3)*cos(3);
p = 2*ones(1,n-1); q = -2*ones(1,n-1); r = zeros(1,n-1);
[xv yv] = fdthomas(p,q,r,a,b,n,ya,yb); plot(xv,yv), grid, xlabel('x'), ylabel('y')

