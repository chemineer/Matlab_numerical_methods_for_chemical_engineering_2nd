x = -1:0.5:1; y = [0.0385 0.1379 1 0.1379 0.0385];
xi = -1:0.01:1;
yi = ratintp(x,y,xi);
plot(xi,yi,x,y,'o'), grid, xlabel('x'), ylabel('y')
