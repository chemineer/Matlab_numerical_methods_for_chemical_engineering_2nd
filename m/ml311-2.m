syms x y z; f = (y+z)*sin(pi*(x^2 + y^2));

double(int(int(int(f,x,0,pi),y,-1,1),0,1))
