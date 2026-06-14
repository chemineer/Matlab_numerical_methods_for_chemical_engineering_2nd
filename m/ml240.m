xd = [0 0.5 1]; yd = [0 0.2 0.8 1]; zd = (xd.^2)'*(1+(yd-1).^3); x = 0:0.25:1; y = 0:0.2:1;
z = interp2(xd, yd', zd', x, y', 'spline'); mesh(x,y,z), xlabel('x'), ylabel('y'), zlabel('z')
