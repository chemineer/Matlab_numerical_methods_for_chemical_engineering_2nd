function z = taylor4s(df,a,b,y0,m)
% Input:
% df: y의 미분, a와 b: x의 하한과 상한, y0: 초기조건, m: 적분구간 수
% Output:
% z: 계산된 y 값들의 벡터
h = (b-a)/m; x = zeros(1,m+1); y = zeros(1,m+1); x = a:h:b; y(1) = y0;
for k = 1:m
    d = df(x(k),y(k));
    y(k+1) = y(k) + h*(d(1) + h*(d(2)/2 + h*(d(3)/6 + h*d(4)/24)));
end
z = [x' y'];
end