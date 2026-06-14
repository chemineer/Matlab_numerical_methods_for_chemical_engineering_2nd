function [x,y] = expEuler(odefun,xi,xf,n,yi)
% explicit Euler 방법에 의한 ODE의 풀이
% odefun: 미분방정식, xi, xf: 적분구간, n: 적분구간 수
% yi: 종속변수 y의 초기값 벡터(xi에서의 함수값)
h = (xf - xi)/n; % 구간길이
yi = (yi(:).'); % 열벡터임을 확인
x = [xi:h:xf-h]; % x 값들의 벡터
y(:,1) = yi; % 초기조건
for i = 1:n-1, y(:,i+1) = y(:,i) + h*feval(odefun,x(i),y(:,i)); end
end