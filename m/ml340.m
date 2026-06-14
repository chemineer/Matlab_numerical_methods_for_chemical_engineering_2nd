df = @(x,y)[(x-y)/2; (2-x+y)/4; (-2+x-y)/8; (2-x+y)/16];
a = 0; b = 3; m = 3; y0 = 1; z = taylor4s(df,a,b,y0,m)
