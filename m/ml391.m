% bmlinode.m
dz = @(x,z) [z(2); 1e-7 * z(1) + 1e-8 * x*(x-100); z(4); 1e-7 * z(3)];
z0 = [0; 0; 0; 1]; a = 0; b = 100; xs = [a b];

% 수치적 정확도를 위한 옵션 추가
options = odeset('RelTol', 1e-8, 'AbsTol', 1e-10);

[x,z] = ode45(dz,xs,z0,options); [n,m] = size(z);
%y(1:n,1) = z(1:n,1) - z(n,1)*z(1:n,3)./z(n,3); % u(b)=z(n,1), v(b)=z(n,3)
y = -(z(:, 1) - z(n, 1) * z(:, 3) ./ z(n, 3));
plot(x,y), grid, xlabel('x'), ylabel('y(x)')
