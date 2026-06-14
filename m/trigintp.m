function [Am Bm] = trigintp(t,y,w0,m)
% trigintp: 삼각함수를 이용한 데이터 안짐작
% input:
%   t,y: 데이터, w0: 주파수, m: 삼각함수 항들의 수
% output:
%   Am, Bm: 삼각함수 항들의 계수
N = length(y); % 데이터의 수
Am = []; Bm = []; A0 = sum(y)/N; Am = [Am A0];
for j = 1:m
    A(j) = 2*sum(y.*cos(j*w0*t))/N; Am = [Am A(j)];
    B(j) = 2*sum(y.*sin(j*w0*t))/N; Bm = [Bm B(j)];
end
tm = 0:0.01:7; csum = 0; ssum = 0;
for j = 1:m
    csum = csum + A(j)*cos(j*w0*tm); ssum = ssum + B(j)*sin(j*w0*tm);
end
ym = A0 + csum + ssum; % 모델
plot(tm,ym,t,y,'o'), grid, legend('삼각함수 안짐작', '데이터')
end