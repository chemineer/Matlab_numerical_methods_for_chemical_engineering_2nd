function zu = hyppdeex(f1,f2,c,xf,tf,n,m)
% hyppdeex: Explicit 방법에 의한 hyperbolic PDE의 풀이
h = xf/n; k = tf/m; % x 방향구간 및 시간구간 길이
x = h:h:(xf-h); t = k:k:tf; % x 방향 및 시간 격자점들의 생성
wx0 = f1(x)'; dwx0 = f2(x)'; % 초기조건 벡터
w00 = 0; w10 = 0; % x=0, x=1에서의 초기 변위
w0t = zeros(m,1); w1t = w0t; % x=0, x=1에서의 경계조건
a = (c*k/h)^2; a2 = a/2; am2 = 2*(1-a); % a: alpha
% 첫 번째 시간구간
w(1,1) = a2*w00 + (1-a)*wx0(1) + a2*wx0(2) + k*dwx0(1);
w(2:n-2,1) = a2*wx0(1:n-3) + (1-a)*wx0(2:n-2) + a2*wx0(3:n-1) + k*dwx0(2:n-2);
w(n-1,1) = a2*wx0(n-2) + (1-a)*wx0(n-1) + a2*w10 + k*dwx0(n-1);
% 두 번째 시간구간
w(1,2) = a*w0t(1,1) + am2*w(1,1) + a*w(2,1) - wx0(1);
w(2:n-2,2) = a*w(1:n-3,1) + am2*w(2:n-2,1) + a*w(3:n-1,1) - wx0(2:n-2);
w(n-1,2) = a*w(n-2,1) + am2*w(n-1,1) + a*w1t(1,1) - wx0(n-1);
% 나머지 시간구간
for j = 3:m
    w(1,j) = a*w0t(j-1,1) + am2*w(1,j-1) + a*w(2,j-1) - w(1,j-2);
    w(2:n-2,j) = a*w(1:n-3,j-1) + am2*w(2:n-2,j-1) + a*w(3:n-1,j-1) - w(2:n-2,j-2);
    w(n-1,j) = a*w(n-2,j-1) + am2*w(n-1,j-1) + a*w1t(j-1,1) - w(n-1,j-2);
end
% 풀이결과
zv = [w0t w' w1t]; wv = [w00 wx0' w10]; zu = [wv; zv];
x = 0:h:1; t = 0:k:tf; mesh(x,t,zu), xlabel('x'), ylabel('t'), zlabel('u')
end