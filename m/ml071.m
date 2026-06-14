f = @(x) x^4 - 3*x^3 + 2*x^2 + 4*x + 1;
[x,y,iter] = muller(f,1,2,1000,1e-6)

[x,y,iter] = muller(f,-1,1,1000,1e-6) % 두 초기값을 -1과 1로 설정
