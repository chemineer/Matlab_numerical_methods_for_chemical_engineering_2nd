% rxnsys.m: 반응 시스템의 풀이
clear all;
% 입력 데이터
K1 = 5e-4; K2 = 4e-2; c0 = [40 15 0 10]; % 초기농도
x0 = [0.1; 0.9]; % 전환율 가정값(열 벡터)
rho = 1; % 완화인자
% 방정식 시스템의 풀이
[x,iter] = newton(@rxnfun,x0,rho,c0,K1,K2);
fprintf('결과 :\n x1 = %6.4f , x2 = %6.4f',x);
fprintf('\n%3d회의 반복계산 후에 해에 도달.\n\n',iter);
