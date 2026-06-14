% hxnout.m
Cp = 2.35; Cpc = 4.1; U = 1; A = 5; % data
mc = 5; T1 = 100; T2c = 15; % operating condition
m = 1:0.1:8; n = length(m); x0 = [50 50]; % initial guess(x(1): T2, x(2): T1c)
y = zeros(1,n); z = zeros(1,n); % y: T2, z: T1c
for k = 1:n


    f = @(x) [m(k)*Cp*(T1-x(1))-mc*Cpc*(x(2)-T2c); ...
    U*A*((x(1)-T2c)-(T1-x(2)))/(log(x(1)-T2c)-log(T1-x(1)))-mc*Cpc*(x(2)-T2c)];
    x = fsolve(f,x0); y(k) = x(1); z(k) = x(2);
end
plot(m,y,m,z,'--'), grid, xlabel('m(kg/s)'), ylabel('T(C)')
legend('T_2','T_1','location','best')
