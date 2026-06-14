% useintpDFT.m
clear all;
w1 = pi; w2 = pi/2; N = 32; n = [0:N-1]; T = 0.1; t = n*T;
x = sin(w1*t) + 0.5*sin(w2*t) + (rand(1,N)-0.5); ti = [0:T/5:(N-1)*T]; k = [0:N-1];
[xi0,Xi0] = intpDFT(T,x,1,ti); [xi1,Xi1] = intpDFT(T,x,1/2,ti);
subplot(411), plot(t,x,'k.',ti,xi0,'r'), title('원래 신호와 안짐작된 신호')
subplot(412), stem(k,abs(Xi0),'k.'), title('원래 스펙트럼')
subplot(413), stem(k,abs(Xi1),'k.'), title('필터링된 스펙트럼')
subplot(414), plot(t,x,'k.',ti,xi1,'r'), title('원래 신호와 필터링된 신호')
