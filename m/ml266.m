format long
g = 9.8; m = 70; cd = 0.22; fun = @(t) sqrt(g.*m./cd).*tanh(sqrt(g.*cd./m).*t);
t0 = 0; tf = 4; n = 5; y = tzint(fun,t0,tf,n)

n = 10; y = tzint(fun,t0,tf,n)

n = 100; y = tzint(fun,t0,tf,n)

n = 1000; y = tzint(fun,t0,tf,n)

