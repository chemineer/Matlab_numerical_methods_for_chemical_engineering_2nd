function Q = SimpsonDat(x, y)
% Simpson의 1/3 규칙에 의한 적분의 수행
% x: 독립변수 벡터(동일간격), y: 함수값 벡터
points = length(x);
if length(y) ~= points, error('x와 y의 길이가 다름.'); return; end
dx = diff(x);
if max(dx)-min(dx) > min(abs(x))/1000, error('x의 간격이 균일하지 않음.'); return; end
h = dx(1);
if mod(points,2) == 0
    warning('구간 수가 홀수: 마지막 구간에서는 Trapezoidal 규칙을 이용.'); n = points - 1;
else, n = points;
end
% 적분
y1 = y(2 : 2 : n - 1); y2 = y(3 : 2 : n - 2);
Q = (y(1) + 4*sum(y1) + 2*sum(y2) + y(n))*h/3;
if n ~= points, Q = Q + (y(points) + y(n))*h/2; end
end