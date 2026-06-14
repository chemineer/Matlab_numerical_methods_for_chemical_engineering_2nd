dyt = @(t,y) 2*y - t.^2 + 1; tv = [0 1]; y0 = 1; h = 0.01;
[t,y] = rk4ode(dyt,tv,y0,h); plot(t,y), grid, xlabel('t'), ylabel('y')
