fx = @(x) x; kxt = @(x,t) -x.^2.*t; a = 0; b = 1; n = 5;
[y u] = FredGN(fx,kxt,a,b,n)
