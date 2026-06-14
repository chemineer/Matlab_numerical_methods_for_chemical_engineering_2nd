% whnoise.m
q = 1024; p = 20; fs = 2000; fl = 200; fh = 600; fn = fs/2;
b = firt(@fun,p); x1 = rand(q,1); x2 = rand(q,1);
u = sqrt(-2*log(x1)).*cos(2*pi*x2); y = convln(u,b);
[A,phi,f] = frsp(u,y,fs);
subplot(2,2,1), plot(real(f(1:q/2)),real(A(1:q/2)))
title('필터크기 응답'), xlabel('f(Hz)'), ylabel('A')
[A,phi,f] = specm(u,fs);
subplot(2,2,2), plot(real(f(1:q/2)),real(A(1:q/2)))
title('백색잡음 입력크기 스펙트럼'), xlabel('f(Hz)'), ylabel('A')
[A,phi,f] = specm(y,fs);
subplot(2,2,3), plot(real(f(1:q/2)),real(A(1:q/2)))
title('출력크기 응답'), xlabel('f(Hz)'), ylabel('A')

function a = fun(f) % 밴드패스 크기응답
    if (f >= 0.2) & (f <= 0.6), a = 1; else, a = 0; end
end

function b = firt(g,p)
    % 지정된 크기응답을 갖는 FIR 필터 디자인
    % Inputs:
    %   g: 필터의 원하는 크기응답을 지정하는 함수, p: 필터 차수
    % Outputs:
    %   b: 필터계수 벡터((2p+1)x1)
    %   FIR 필터출력은 y(k) = b(1)u(k)+b(2)u(k-1)+...+b(2p+1)u(k-2p)
    b = zeros(2*p+1,1); c = zeros(p,1); n = 50; h = 1/n; b(p+1) = simpint(0,1,n,g);
    for k = 1:p
        c(k) = g(0) + cos(pi*k)*g(1);
        for i = 1:n-1
            if mod(i,2), c(k) = c(k) + 4*cos(pi*k*(i*h))*g(i*h);
            else, c(k) = c(k) + 2*cos(pi*k*(i*h))*g(i*h); end
        end
        c(k) = h*c(k)/3;
    end
    for k = 1:p % Add Hamming window
        b(p+1+k) = (0.54 + 0.46*cos(k*pi/p))*c(k); b(p+1-k) = b(p+1+k);
    end
end


function y = simpint(a,b,n,f)
% Simpson 방법에 의한 적분
% Inputs:
%   a,b: 적분의 하한 및 상한, n: 패널 수(>=2, 짝수), f: 피적분 함수
h = (b - a)/n; y = f(a) + f(b);
for i = 1:n-1
    if mod(i,2), y = y + 4*f(a+i*h); else, y = y + 2*f(a+i*h); end
end
y = h*y/3;
end

function z = convln(x,y)
% 두 이산신호의 convolution을 계산
% Inputs:
%   x: 첫 번째 신호의 샘플벡터(nx1), y: 두 번째 신호의 샘플벡터(mx1, m<=n)
% Outputs:
%   z: x와 y의 convolution을 포함하는 벡터(nx1)
n = length(x); m = length(y); Y = zeros(n,1); Y(1:m) = y;
X = fft(x); Y = fft(Y); X = X.*Y; z = real(ifft(X)); % Inverse DFT of X(m)Y(m)
end
