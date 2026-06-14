f = @(x) exp(x)+sin(3*pi*x);
[xs fs] = optga(f,[0 1],8,40,50,0.005,0.6)
