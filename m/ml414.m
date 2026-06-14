% Cellferm.m: Cell 질량, 페니실린 농도, 온도분포들을 계산
% 함수 Collocation을 이용하여 미분방정식을 풀이
clear all; w = [13.1 0.005 30 0.94 1.71 20]; % 입력 데이터
y0 = [0.03 0]; yf = 0; guess = 3; % 초기조건 및 최종조건
n = 10; rho = 0.9; % 내부 병치점들의 수 및 이완인자
fname = 'cellode'; fth = 'celltheta'; % 미분방정식 및 필요조건 함수 파일
[t,y] = Collocation(fname,0,1,y0,yf,guess,n,rho,[],w,fth); % 미분방정식의 풀이
%for k = 1:n+2, theta(k) = fzero(fth,30,[],y(:,k),w); end % 온도변화
for k = 1:n+2, theta(k) = fzero(@(t) feval(fth, t, y(:,k), w), 30); end
subplot(2,2,1), plot(t,y(1,:)), grid, xlabel('Time'), ylabel('Cell'), title('(a)')
subplot(2,2,2), plot(t,y(2,:)), grid, xlabel('Time'), ylabel('Penicillin'), title('(b)')
subplot(2,2,3), plot(t,y(3,:)), grid, xlabel('Time'), ylabel('First Adjoint'), title('(c)')
subplot(2,2,4), plot(t,theta), grid, xlabel('Time'), ylabel('온도(deg C)'), title('(d)')
