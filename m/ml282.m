% tempdist.m: Gauss-Legendre 구적법을 이용한 수직벽을 흐르는 액체 층의 온도분포 계산
clear all;
% 데이터 입력
%etv = input('독립변수 벡터(eta): ');
etv = [0:0.2:2]
h = etv(2) - etv(1); % Step 크기
% fname = input('적분될 함수를 정의하는 m-파일의 이름: ');
f = @(x) exp(-x.^3); % 피적분 함수의 정의
% 온도분포 계산
for k = 1:length(etv), theta(k) = GaussLegend(f,0,etv(k),h); end
theta = 1 - theta/gamma(4/3); plot(etv,theta), grid, xlabel('\eta'), ylabel('\theta')
