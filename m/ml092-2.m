gam = 4.8; delt = 1.1;
f = @(x) [gam*x(1)*x(2)/(1+x(2))-x(1); -x(2)-x(1)*x(2)/(1+x(2))+delt];
x0 = [1 0.1]'; tol = 1e-5; [x,iter] = broyden(f,x0,tol)
