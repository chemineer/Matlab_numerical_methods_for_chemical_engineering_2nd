f = @(x,y,z) (y+z).*sin(pi*(x.^2 + y.^2));
It = triplequad(f,0,pi,-1,1,0,1), Ii = integral3(f,0,pi,-1,1,0,1)
