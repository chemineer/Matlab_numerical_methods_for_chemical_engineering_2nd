% spvolSRK.m : SRK 방정식에 의한 비부피 계산
tol = 1e-6;
%P = input('압력범위 벡터(Pa): '); T = input('온도(K): ');
%Tc = input('임계온도(K): '); Pc = input('임계압력(Pa): ');
%omega = input('이심인자(Acentric factor): ');
P = [1:40]*101325
T = 500
Tc = 425.2
Pc = 3797e3
omega = 0.1931


% Soave-Redlich-Kwong 상태방정식의 상수
R = 8314; % 기체상수(J/kmol.K)
a = 0.4278 * R^2 * Tc^2 / Pc; b = 0.0867 * R * Tc / Pc; sc = [-0.15613,1.55171, 0.48508];
s = polyval(sc,omega); alpha = (1 + s * (1 - sqrt(T/Tc)))^2;
V0 = R*T./P; % 초기 부피값
for i=1:length(P), f = @(x) P(i) - R*T/(x-b) + a*alpha/x/(x+b);
[V iter] = newtonrap(f,V0(i),tol); vol(i) = V; end
loglog(P/1000,V0,'.',P/1000,vol), xlabel('Pressure, kPa'), ylabel('Specific Volume, m^3/kmol')
grid, legend('Ideal','SRK')
