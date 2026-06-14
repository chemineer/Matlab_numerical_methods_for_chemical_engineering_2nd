% shootode.m: Shooting 방법에 의한 경계치 문제의 풀이
% 안짐작 계산: Aitken 방법을 이용(함수 Aitken)
fun = @(x, z) [z(2); 6*z(1)/x^2]; s = -2:0.25:-1; s0 = []; ns = length(s);
b = zeros(1, ns);
for i = 1:ns
    [x, z] = ode45(fun, [1 2], [1 s(i)]); [m, n] = size(z); b(1, i) = z(m, 1);
end
s0 = Aitken(b, s, 1)
[x, z] = ode45(fun, [1 2], [1 s0]); plot(x, z(:, 1)); xlabel('x'), ylabel('y'), grid

function [q r] = Aitken(x, y, xv)
% Aitken의 방법을 이용한 안짐작 계산
% x, y: 데이터
% xv: 안짐작이 요구되는 x 값
% q: xv에서의 y의 안짐작 결과
% r: 중간결과들

n = length(x); p = zeros(n); p(1, :) = y;
for j = 1:n-1
    for i = j+1:n, p(j+1, i) = (p(j, i)*(xv-x(j))-p(j, j)*(xv-x(i)))/(x(i)-x(j)); end
end
q = p(n, n); r = [x.' p.'];
end
