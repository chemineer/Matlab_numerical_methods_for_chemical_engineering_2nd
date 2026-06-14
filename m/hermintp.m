function ntag = hermintp(fun, a, b)
    % Hermite 다항식을 이용한 안점작 계산
    % fun: 안점작할 함수 이름
    % [a b]: 구간
    ntag = 0; eps = 1e-6;

    % 구간의 양 끝점에서 함수값을 구하고 유한차분을 이용하여 1차미분을 계산
    fa = feval(fun,a); dx = sqrt(eps); f1a = (feval(fun,a+dx) - fa)/dx;
    fb = feval(fun,b); f1b = (fb - feval(fun,b-dx))/dx;
    n = 500; x = linspace(a,b,n); f = zeros(size(x)); p = zeros(size(x));
    for k = 1:n
        f(k) = feval(fun,x(k)); [L00, L01, L10, L11] = hermpoly(x(k),a,b);
        p(k) = fa*L00 + f1a*L01 + fb*L10 + f1b*L11;
    end
    plot(x,f,x,p,'-.'), xlabel('x'), ylabel('f(x), p(x)'), title('f(x) 및 Hermite 안점작 다항식 p(x)')
    legend('f(x)', 'p(x)', 'Location', 'Best'); ntag = 1;
end