fx = @(x) x; kxt = @(x,t) -x.^2.*t; g = @(x) x+4*x.^2/9;
a = 0; b = 1; n = 4; [y u] = FredTrap(fx,kxt,a,b,n); gy = g(y);
plot(y,u,':',y,gy), grid, xlabel('x'), ylabel('u(x)'), legend('Trapezoidal 규칙', '엄밀해')
