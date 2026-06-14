% shsecant.m
ya = 1; a = 0; b = 1; maxiter = 10; crit = 1e-5;
f = @(x,y) [y(2); -2*y(1)*y(2)];
h = 'y1 + y2 - 1/4';
s(1) = 0; s(2) = 1; absz = 1; xs = [a b]; k = 1;
while (absz > crit) & (k <= maxiter)
    if k > 2, s(k) = s(k-1) - (s(k-1) - s(k-2))*z(k-1)/(z(k-1) - z(k-2)); end
    y0 = [ya s(k)]; [x,y] = ode45(f,xs,y0); [n m] = size(y);
    y1 = y(n,1); y2 = y(n,2); z(k) = eval(h); absz = abs(z(k)); k = k + 1;
end
xi = 0:0.01:1; yi = 1./(1+xi); plot(xi,yi,x,y(:,1),':'), grid
xlabel('x'), ylabel('y(x)'), legend('엄밀해','Secant shooting')
