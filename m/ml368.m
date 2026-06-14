% milhamcomp.m
f = @(x,y) 30 - 5*y; a = 0; b = 3; h = 1/8; y0 = 1;
x = zeros(1,25); y = x; x = 0:h:3; y(1:4) = [1 0.94324 0.89749 0.86209];
[xm,ym] = milsim(f,x,y); [xh,yh] = Hamming(f,a,b,h,y0);
plot(xm,ym,xh,yh,':'), grid, xlabel('x'), ylabel('y(x)')
legend('Milne-Simpson','Hamming')
