f = @(x) 2*x.^2*exp(1.3*x); a = 0; b = 2; n = 10; Q = Romberg(f,a,b,n)
