function [q r] = Aitken(x,y,xv)
% Aitken의 방법을 이용한 안짐작 계산
% x,y: 데이터, xv: 안짐작이 요구되는 x 값
% q: xv에서의 y의 안짐작 결과, r: 중간결과들

n = length(x); p = zeros(n); p(1,:) = y;
for j = 1:n-1
    for i = j+1:n, p(j+1,i) = (p(j,i)*(xv-x(j))-p(j,j)*(xv-x(i)))/(x(i)-x(j));
    end
end
q = p(n,n); r = [x.' p.'];
end