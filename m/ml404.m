% nonbvpfd.m: 유한차분을 이용한 비선형 경계치 문제의 풀이
a = 0; b = 1; ya = 1; yb = 2; maxiter = 10; n = 4; w = 0.1;
v = 1/(2*(1+w)); h = (b-a)/n;
%y(1:n-1) = 1;
y = ones(1, n-1);

for k = 1:maxiter
    y(1) = v*(ya + 2*w*y(1) + y(2) + (ya^2 - 2*ya*y(2) + y(2)^2)/(4*y(1)));
    y(2) = v*(y(1) + 2*w*y(2) + y(3) + (y(1)^2 - 2*y(1)*y(3) + y(3)^2)/(4*y(2)));
    y(3) = v*(y(2) + 2*w*y(3) + yb + (y(2)^2 - 2*y(2)*yb + yb^2)/(4*y(3)));
end
x = [a a+h a+2*h a+3*h b]; z = [ya y yb];
f = @(z) sqrt(3*z + 1); xi = 0:0.01:1; yi = f(xi); % 엄밀해
plot(xi,yi,x,z,':'), grid, xlabel('x'), ylabel('y(x)')
legend('엄밀해','비선형 shooting','location','best')
