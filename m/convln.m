function z = convln(x,y)
% 두 이산신호의 convolution을 계산
% Inputs:
%   x: 첫 번째 신호의 샘플벡터(nx1), y: 두 번째 신호의 샘플벡터(mx1, m<=n)
% Outputs:
%   z: x와 y의 convolution을 포함하는 벡터(nx1)
n = length(x); m = length(y); Y = zeros(n,1); Y(1:m) = y;
X = fft(x); Y = fft(Y); X = X.*Y; z = real(ifft(X)); % Inverse DFT of X(m)Y(m)
end