t = 0:4; h = [0.3 14.8 20.7 15.9 2.0]; p = polyfit(t,h,2); % 다항식 접합
g = -2*p(1), v0 = p(2), h0 = p(3), ti = 0:0.1:4; hi = polyval(p,ti);
plot(ti,hi,t,h,'o')
grid, xlabel('t(sec)'), ylabel('h(m)')
