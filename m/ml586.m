f = @(x) x(1)*(x(1)-x(2)-4)+x(2)*(x(2)-1); x0 = [0 0]; epsx = 1e-6;
[xp,fp] = nmopt(f,x0,epsx)
