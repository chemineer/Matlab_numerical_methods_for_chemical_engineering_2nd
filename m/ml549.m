y = [1 1 1 1 0 0 0 0]; w = 2*pi/length(y); t = 0:w:(2*pi-w); m = 4; w0 = 1;
[Am Bm] = trigintp(t,y,w0,m)
