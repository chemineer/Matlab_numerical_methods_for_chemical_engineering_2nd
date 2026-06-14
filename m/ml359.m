dyt = @(t,y) 2*t - y; y0 = -1; a = 0; b = 1; h = 0.1;
[t, y] = AdamsBash(dyt,a,b,y0,h,4)
