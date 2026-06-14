% lzmodel.m: Lorenz 모델의 계산
h = 0.03125; tspan = [0 20]; y0 = [5 5 5]; a = 10; b = 28; c = 8/3;
[t y] = rk4ode(@lzeqn, tspan, y0, h, a, b, c);
subplot(2,2,1), plot(y(:,1),y(:,2)), title('x vs. y'), xlabel('x'), ylabel('y'), grid
subplot(2,2,2), plot(y(:,1),y(:,3)), title('x vs. z'), xlabel('x'), ylabel('z'), grid
subplot(2,2,3), plot(y(:,2),y(:,3)), title('y vs. z'), xlabel('y'), ylabel('z'), grid
subplot(2,2,4), plot3(y(:,1),y(:,2),y(:,3)), xlabel('x'), ylabel('y'), zlabel('z'), grid

