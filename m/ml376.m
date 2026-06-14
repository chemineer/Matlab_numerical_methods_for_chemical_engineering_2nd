tspan = [0 1]; y0 = [4/3 2/3]; [t y] = ode15s(@stfode, tspan, y0);
plot(t,y(:,1),t,y(:,2),'--'), grid, legend('y_1(t)','y_2(t)'), xlabel('t'), ylabel('y(t)')

