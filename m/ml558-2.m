% specdft.m
nt = 128; nb = 10; y = [ones(1,nb) zeros(1,nt-nb)]; dt = 0.0625; T = dt*nt;
df = 1/T; fmax = (nt/2)*df; f = 0:df:(nt/2-1)*df; yf = fft(y); yp = (2/nt)*yf(1:nt/2);
bar(f,abs(yp),'w'), axis([0 fmax 0 0.2]), xlabel('Frequency(Hz)'), ylabel('abs(DFT)')
