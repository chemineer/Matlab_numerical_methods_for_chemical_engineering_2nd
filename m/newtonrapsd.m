function x = newtonrapsd(c)
% Synthetic division 방법을 이용한 다항방정식의 풀이
% 벡터 c는 다항식의 계수들을 내림차순으로 포함

% 초기화
tol = 1e-6; n = length(c) - 1; a = c;
for k = n:-1:3
    x0 = -a(2)/a(1); x1 = x0 + 0.1; iter = 0; maxiter = 100;
    % Newton-Raphson 방법에 의한 다항식의 풀이
    while abs(x0 - x1) > tol & iter < maxiter
        iter = iter + 1; x0 = x1; fv = polyval(a,x0);
        fp = polyval(polyder(a),x0); % 다항식의 미분
        if fp ~= 0, x1 = x0 - fv / fp; % 해의 새로운 근사
        else, x1 = x0 + 0.01;
        end
    end
    x(n-k+1) = x1; % 해
    % 새로운 계수들의 계산
    b(1) = a(1);
    for r = 2:k, b(r) = a(r) + b(r-1) * x1; end
    if iter == maxiter, disp('경고: 최대 가능 반복계산 횟수에 도달.'); end
    clear a; a = b; clear b;
end
% 나머지 2차식의 근
delta = a(2)^2 - 4*a(1)*a(3); x(n-1) = (-a(2) - sqrt(delta))/(2*a(1));
x(n) = (-a(2) + sqrt(delta))/(2*a(1)); x = x';
end
