% revrxns.m: 선형 상미분시스템의 풀이함수 linODEsys를 이용한 가역반응 시스템의 풀이
clear all;
k1 = 1; k2 = 0; k3 = 2; k4 = 3; % 속도상수
c0 = [1 0 0]; % 초기농도
tmax = 5; dt = 0.1; % tmax: 최대 적분시간, dt: 시간구간
K = [-k1, k2, 0; k1, -k2-k3, k4; 0, k3, -k4]; t = [0:dt:tmax]; % 시간 벡터
if t(end) ~= tmax, t(end+1) = tmax; end
tlen = length(t); t0 = zeros(1,tlen);
method = 2; % method = 1: 지수행렬 방법, 2: 고유벡터 방법
c = linODEsys(K,c0,t,t0,method); % 방정식 시스템의 풀이
plot(t,c), grid, xlabel('Time'), ylabel('Concentration'), legend('C_A','C_B', 'C_C')
