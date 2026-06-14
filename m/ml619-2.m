f = @(x) 2*x^2*sin(x) + exp(-x); x0 = 1;
[x, fv] = fminunc(f, x0)
