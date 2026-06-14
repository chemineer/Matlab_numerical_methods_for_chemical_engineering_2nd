f = @(x) -2.5*sin(x)+x.^2/11.8; x1 = 0; x2 = 5;
[x, fval] = fminbnd(f, x1, x2)
