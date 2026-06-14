function z = rctrapz(f,a,b,n)
% Input:
% f: 피적분 함수, a, b: 적분구간의 하한 및 상한, n: 반복 횟수
% Output:
% z: I(J) 값

m = 1; h = b-a; z = zeros(1,n+1); z(1) = h*(f(a)+f(b))/2;
for j = 1:n
    m = 2*m; h = h/2; sm = 0;
    for k = 1:m/2, x = a + h*(2*k-1); sm = sm + f(x); end
    z(j+1) = z(j)/2 + h*sm;
end