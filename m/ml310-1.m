f = @(x,y) x.^3 + x + y;
Ii = integral2(f,1,2,0,3), Id = dblquad(f,1,2,0,3), Iq = quad2d(f,1,2,0,3)
