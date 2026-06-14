f = @(x) 0.3+20*x-180*x.^2+650*x.^3-880*x.^4+360*x.^5;
x = 0:0.1:1.0; n = length(x); y = f(x); dd = diff(y)./diff(x); dg = gradient(y,0.1);
xd = (x(1:n-1) + x(2:n))/2; % 각 구간의 중간위치
xt = 0:0.01:1; yt = 20-360*xt+1950*xt.^2-3520*xt.^3+1800*xt.^4;
plot(xt,yt, xd,dd,'o', x,dg,'*'), grid, xlabel('x'), ylabel('df(dx)'), legend('Exact','diff','gradient')
