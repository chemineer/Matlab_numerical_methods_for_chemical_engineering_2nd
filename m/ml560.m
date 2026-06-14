% pssin.m: Sinusoid 함수에 대한 파워 스펙트럼을 계산
clear all;
n = 8; dt = 0.02; fs = 1/dt; tintv = (0:n-1)/fs; % 샘플링 시점들의 벡터
y = 5 + cos(2*pi*12.5*tintv) + sin(2*pi*18.75*tintv); % 샘플된 함수값
Y = fft(y)/n; % FFT: 첫 번째 계수가 샘플들의 평균이 되도록 n으로 나누어 준다.
f = (0:n-1)*fs/n; Y(1) = []; f(1) = []; fnyquist = fs/2; f = (1:n/2)/(n/2)*fnyquist;
Py = abs(Y(1:n/2)).^2;
stem(f, Py, 'linewidth', 2, 'MarkerFaceColor', 'blue'), title('파워 스펙트럼')
xlabel('주파수(Hz)'); ylim([0 0.3]);
