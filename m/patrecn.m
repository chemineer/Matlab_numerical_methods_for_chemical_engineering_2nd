function [ps] = patrecn(y)
% patrecn.m: 패턴인식 fft의 보기
n = length(y); n2 = n/2; z = fft(y); z2 = z/n2; a0 = real(z2(1))/2;
a(1:n2) = real(z2(2:n2+1)); b(1:n2) = imag(z2(2:n2+1)); a(n2) = a(n2)/2;
r = a0*ones(1,100); t = linspace(0, 2*pi);

for k = 1:n2,        r = r + a(k)*cos(k*t) - b(k)*sin(k*t); end
xc = r.*cos(t); ys = r.*sin(t);
plot(xc,ys), grid on, hold on
s = 2*pi/n; t2 = 0:s:2*pi-s; d1 = y.*cos(t2); d2 = y.*sin(t2);
plot(d1,d2,'*'), axis([-1.2 1.2 -1.2 1.2]), hold off, ps = z.*conj(z); % 파워 스펙트럼
end