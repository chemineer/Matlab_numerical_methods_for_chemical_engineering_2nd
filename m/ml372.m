% odesys.m
dxt = @(t,x) [(x(1)-x(1)^3/3-x(2))/2; 2*x(1)]; ti = 0; tf = 10; h = 0.01;
x0 = [0 -1]';
[t1, x1] = Heun(dxt,ti,tf,h,x0); [t2, x2] = AdamsMoulton(dxt,ti,tf,h,x0);
subplot(1,2,1), plot(t1,x1(1,:)',':',t1,x1(2,:)'), grid, xlabel('t'), ylabel('y, z'),
legend('y','z'), title('Heun method')
subplot(1,2,2), plot(t2,x2(1,:)',':',t2,x2(2,:)'), grid, xlabel('t'), ylabel
('y, z'),
legend('y','z'), title('Adams-Moulton method')
