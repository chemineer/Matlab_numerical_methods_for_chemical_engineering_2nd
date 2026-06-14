Re = 8e4; eD = 1.5e-4; xa = 0; xb = 1;
fun = @(x) 1/sqrt(x) + 0.86*log(eD/3.7 + 2.51/(Re*sqrt(x))); f = Brent(fun,xa,xb)
