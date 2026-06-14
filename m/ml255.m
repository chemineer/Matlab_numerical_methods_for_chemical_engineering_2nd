f = @(x) log(x); a = 1.5; h = 0.5; n = 3;
m = -1; dy = diffdr(a,h,n,m,f) % backward 차분

m = 0; dy = diffdr(a,h,n,m,f) % central 차분

m = 1; dy = diffdr(a,h,n,m,f) % forward 차분

