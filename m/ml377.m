% solstode.m: stiff 미분방정식의 풀이
dy = @(t,y) [998*y(1) - 1998*y(2); 1000*y(1) - 2000*y(2)];
tspan = [0 0.1]; y0 = [1 2]; [t y] = ode23s(dy, tspan, y0); tv = 0:0.0001:0.1;
xv = (-1998*exp(-2*tv) + 2996*exp(-1000*tv))/998;
yv = (-1000*exp(-2*tv) + 2996*exp(-1000*tv))/998;
plot(t,y(:,1),t,y(:,2),':',tv,xv,'-',tv,yv,'--'), grid
legend('x','y','x(엄밀해)','y(엄밀해)'), xlabel('t'), ylabel('x,y')
fprintf('풀이함수: t=%g에서 x=%g, y=%g\n',t(end),y(end,1),y(end,2));
fprintf('엄밀해: t=%g에서 x=%g, y=%g\n',tv(end),xv(end),yv(end));

