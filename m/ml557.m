% fftsin.m: Sinusoid 함수의 이산 Fourier 변환(fft를 이용)
clear all;
n = 8; dt = 0.02; fs = 1/dt; T = n*dt; fn = fs/2; % Nyquist 주파수
fm = 1/T; % 측정 가능한 최저 주파수 fmin
tintv = (0:n-1)/fs; % 샘플링 시점들의 벡터
y = 5 + cos(2*pi*12.5*tintv) + sin(2*pi*18.75*tintv); % 샘플된 함수값
subplot(3,1,1), plot(tintv,y,'-ok','linewidth',2,'MarkerFaceColor','black'),
title('(a) f(t) vs. t(s)')
Y = fft(y)/n; % FFT: 첫 번째 계수가 샘플들의 평균이 되도록 n으로 나누어 준다.
f = linspace(fm, fn, n/2); Y(1) = []; Yp = Y(1:n/2);
subplot(3,1,2), stem(f, real(Yp),'linewidth',2,'MarkerFaceColor','blue'), grid
title('(b) 실수부 vs. 주파수')
subplot(3,1,3), stem(f, imag(Yp),'linewidth',2,'MarkerFaceColor','blue'), grid;
title('(b) 허수부 vs. 주파수'), xlabel('주파수(Hz)')
