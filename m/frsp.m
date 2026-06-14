function [a,phi,f] = frsp(u,y,fs)
% 입력과 출력으로부터 이산시간 시스템의 주파수 응답 계산
% Inputs:
%   u: 입력신호 벡터(nx1), y: 출력신호 벡터(nx1), fs: 샘플링 주파수(Hz)
% Outputs:
%   a: 크기응답 벡터(nx1), phi: 위상응답 벡터(nx1), f: f(k) = (k-1)*fs/n (nx1 벡터)
n = length(u); c = zeros(n,1); d = zeros(n,1);
[c,d,f] = specm(u,fs); [a,phi,f] = specm(y,fs);

for i = 1:n
    a(i) = a(i)/max([c(i),eps]); phi(i) = phi(i) - d(i);
    while phi(i) < -180, phi(i) = phi(i) + 360; end
    while phi(i) > 180, phi(i) = phi(i) - 360; end
end
end