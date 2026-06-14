f = @(x,y) 1+y.^2; y0 = 0; a = 0; b = 1.4; m = 20; crit = 1e-6;
[x y] = rkfode(f,a,b,y0,m,crit); plot(x,y), grid, xlabel('x'), ylabel('y(x)')
