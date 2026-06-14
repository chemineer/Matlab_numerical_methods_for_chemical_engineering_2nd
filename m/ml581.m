f = @(x) (x-0.8).^2; p = [0 1]; tol = 1e-6;
[fmin,a,iter] = goldsec(f,p,tol)
