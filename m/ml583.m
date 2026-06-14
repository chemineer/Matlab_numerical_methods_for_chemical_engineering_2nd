func = @(x) -2.5*sin(x)+x.^2/11.8;
[fm,xm,iter] = Fbin(func,a,b,1e-6)
