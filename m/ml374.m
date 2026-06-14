ts = [0 10]; C0 = [0.3 0]; [t C] = ode45(@dilode,ts,C0);
plot(t,C(:,1),t,C(:,2),':'), grid, legend('C_1(t)','C_2(t)'), xlabel('t'), ylabel('C(t)')

