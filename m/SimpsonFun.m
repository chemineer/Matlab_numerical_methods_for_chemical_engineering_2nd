function Q = SimpsonFun(fun,a,b,n)
% Simpson의 1/3 규칙에 의한 적분의 수행: 함수가 주어진 경우

% fun: 함수 이름, [a b]: 적분구간, n: 소구간 수(짝수)
if n/2 ~= floor(n/2), disp('n은 짝수여야 함.'); return; end
h = (b-a)/n; fv = feval(fun, a);
for i = 1:n/2
    m = 2*i - 1; x = a + h*m; g = feval(fun, x);
    fv = fv + 4*g; m = 2*i; x = a + h*m; g = feval(fun, x);
    if i == n/2, fv = fv + g;
    else, fv = fv + 2*g;
    end
end
Q = h*fv/3;
end