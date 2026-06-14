f = @(x) 13*(x - x.^2).*exp(-3*x/2); a = 0; b = 4; crit = 1e-6; [z,eh] = adqsim(f,a,b,crit)
