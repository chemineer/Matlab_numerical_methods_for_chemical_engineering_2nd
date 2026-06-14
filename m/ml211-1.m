x = [1 2 4 5]; y = [0 0.3010 0.6021 0.6990]; xi = 3; yi = lagrintp(x, y, xi)

xi = 1:0.1:5; yp = lagrintp(x, y, xi); plot(xi, yp, x, y, 'o'), xlabel('x'), ylabel('log(x)')
