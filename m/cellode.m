function f = cellode(t,y,w,fth)
% 온도
%theta = fzero(fth,30,[],y,w);
theta = fzero(@(t) feval(fth, t, y, w), 30);
b1 = w(1) * (1-w(2)*(theta-w(3))^2) / (1-w(2)*(25-w(3))^2);
if b1<0, b1=0; end
b2 = w(4) * (1-w(2)*(theta-w(3))^2) / (1-w(2)*(25-w(3))^2);
if b2<0, b2=1e-6; end
b3 = w(5) * (1-w(2)*(theta-w(6))^2) / (1-w(2)*(25-w(6))^2);
if b3<0, b3=0; end
% 함수값을 계산
f(1) = b1*y(1) - b1/b2*y(1)^2; f(2) = b3*y(1); f(3) = -b1*y(3) + 2*b1/b2*y(1)*y(3) - b3;
f = f'; % 열벡터로 전환
end
