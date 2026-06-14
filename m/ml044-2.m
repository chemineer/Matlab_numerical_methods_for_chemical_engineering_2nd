Re = 8e4; eD = 1.5e-4; fun= @(x) 1/sqrt(x) + 0.86*log(eD/3.7+ 2.51/Re/sqrt(x));
[x,fv,re,iter] = bisec(fun,0,1,1e-6,1000)
