B3 = quad(inline('x.*(x.^2-1/3).^2','x'),-1,1)/quad(inline('(x.^2-1/3).^2','x'),-1,1)

C3 = quad(inline('x.*(x.^2-1/3).*x','x'),-1,1)/quad(inline('x.^2','x'),-1,1)
