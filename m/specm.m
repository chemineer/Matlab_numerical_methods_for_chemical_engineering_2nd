function [a,phi,f] = specm(x,fs)
% 이산신호의 크기 및 위상 스펙트럼을 계산
% Inputs:
%   x: 이산신호 벡터(nx1), fs: 샘플링 주파수(Hz)
% Outputs:
%   a: x의 크기 스펙트럼 벡터(nx1), phi: x의 위상 스펙트럼 벡터(nx1)
%   f: f(k) = (k-1)*fs/n (nx1 벡터)
n = length(x); phi = zeros(n,1); y = fft(x); a = abs(y); f = (fs/n)*[0:n-1]';
for i = 1:n
    if a(i) > eps, phi(i) = (180/pi)*atan2(imag(y(i)),real(y(i))); % 4사분면 역탄젠트를 계산
    else, phi(i) = 0; end
end
end