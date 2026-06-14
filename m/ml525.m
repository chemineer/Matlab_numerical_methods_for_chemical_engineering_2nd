% bzcxy.m: Bezier 곡선
x = [-9 -8 -8 -4; -4 -3 -1 0; 0 2 3 5; 5 6 20 18];
y = [0 1 2.5 2.5; 2.5 3.5 4 4; 4 4 4 2; 2 2 3 0];
t = 0:0.01:1;
xp1 = 0; for k = 1:4, xp1 = xp1 + x(1,k)*bzcknt(k-1,3); end
xp2 = 0; for k = 1:4, xp2 = xp2 + x(2,k)*bzcknt(k-1,3); end
xp3 = 0; for k = 1:4, xp3 = xp3 + x(3,k)*bzcknt(k-1,3); end
xp4 = 0; for k = 1:4, xp4 = xp4 + x(4,k)*bzcknt(k-1,3); end
yp1 = 0; for k = 1:4, yp1 = yp1 + y(1,k)*bzcknt(k-1,3); end
yp2 = 0; for k = 1:4, yp2 = yp2 + y(2,k)*bzcknt(k-1,3); end
yp3 = 0; for k = 1:4, yp3 = yp3 + y(3,k)*bzcknt(k-1,3); end
yp4 = 0; for k = 1:4, yp4 = yp4 + y(4,k)*bzcknt(k-1,3); end
P1 = [expand(xp1), expand(yp1)], P2 = [expand(xp2), expand(yp2)]
P3 = [expand(xp3), expand(yp3)], P4 = [expand(xp4), expand(yp4)]
p1x = subs(xp1,t); ply = subs(yp1,t); p2x = subs(xp2,t); p2y = subs(yp2,t);
p3x = subs(xp3,t); p3y = subs(yp3,t); p4x = subs(xp4,t); p4y = subs(yp4,t);
plot(p1x,ply,p2x,p2y,p3x,p3y,p4x,p4y,x,y,'o'), grid, xlabel('x'), ylabel('y')
