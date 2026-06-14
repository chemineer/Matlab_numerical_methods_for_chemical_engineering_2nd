[t,y] = RungeKutta(@fn,0,2,0.2,0,5); ti = 0:0.01:2; yi = ti.*exp(-ti.^2); plot(ti,yi,t,y,'o'), grid
xlabel('t'), ylabel('y(t)'), legend('엄밀해','5차 RK 근사해')
