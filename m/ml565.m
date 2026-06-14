% twodfft.m
m = 64; n = m; dx = 1/8; dy = 1/10; x = zeros(m,1); y = zeros(n,1);
f = @(x,y) exp(-y)*sin(pi*x);
for k = 1:m
    x(k) = (k-1)*dx;
    for i = 1:n, y(i) = (i-1)*dy; Z(k,i) = f(x(k),y(i)); end
end
subplot(1,2,1), mesh(real(x),real(y),real(Z'))
title('2차원 신호'), xlabel('x'), ylabel('y'), zlabel('z')
A = abs(fft2(Z)); % 2차원 FFT
for k = 1:m
    x(k) = (k-1)/(m*dx);
    for i = 1:n, y(i) = (i-1)/(n*dy); end
end
subplot(1,2,2), mesh(real(x(1:m/2)),real(y(1:n/2)),real(A(1:m/2,1:n/2)))
title('신호의 FFT'), xlabel('f_x'), ylabel('f_y'), zlabel('A')
