function [xh,Xh] = intpDFT(T,x,Ws,ti)
% 이산 Fourier 변환을 이용한 안짐작
% input:
%   T: 샘플링 시간, x: 이산 데이터(discrete-time sequence)
%   Ws: 정규화된 정지 주파수, ti: 안짐작 시간범위
% output:
%   Xh: x의 Fourier 변환(Xh=fft(x)), xh: 안짐작 결과

if nargin < 4, ti = 5; end
if nargin < 3 || Ws > 1, Ws = 1; end
N = length(x);
if length(ti) == 1, ti = 0:T/ti:(N-1)*T; end
ks = ceil(Ws*N/2); Xh = fft(x);
Xh(ks+2:N-ks) = zeros(1,N-2*ks-1); % 필터링된 스펙트럼
xh = zeros(1,length(ti));
for k = 2:N/2, xh = xh + Xh(k)*exp(j*2*pi*(k-1)*ti/N/T); end
xh = real(2*xh + Xh(1) + Xh(N/2+1)*cos(pi*ti/T))/N;
end