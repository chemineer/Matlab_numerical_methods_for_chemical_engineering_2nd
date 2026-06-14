x = [0 15]; y0 = [pi/2 0]; [x y] = ode45(@penode, x, y0);
plot(x,y(:,1),x,y(:,2),':'), grid, legend('y_1','y_2'), xlabel('x'), ylabel('y(x)')

