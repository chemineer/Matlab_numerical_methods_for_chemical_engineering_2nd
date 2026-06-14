f = @(x) (1/8)*(x.^2-4).^2 - 1; x0 = [0 3]; epsx = 1e-6;
[xp,fp] = quadopt(f,x0,epsx)
