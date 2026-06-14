fx = @(x) x; kxt = @(x,t) x.*t; g = @(x) x.*exp(x.^3/3);
a = 0; b = 1; n = 4; [y u] = VolEuler(fx,kxt,a,b,n); gy = g(y);
plot(y,u,':',y,gy), grid, xlabel('x'), ylabel('u(x)'), legend('Euler 방법', '엄밀해')
