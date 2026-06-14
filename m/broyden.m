function [x, iter] = broyden(fun, x0, tol)
% Broyden 방법을 이용한 n 비선형 방정식의 풀이
% input
% fun: 방정식 파일 이름
% x0: 해의 초기가정값(열 벡터)
% tol: 수렴기준
% n: 변수 수(방정식 수)
% output
% x: 해 벡터
% iter: 반복계산 횟수

n = length(x0); fn = zeros(n,1); iter = 0; maxiter = 1000; x = x0;
Bn = eye(n); % jacobian 초기값
fn = feval(fun,x);
fn = fn(:); % 어떤 형태든 열 벡터로 바꿈
while((norm(fn) > tol) || iter >= maxiter)
    iter = iter + 1; pn = -Bn*fn; tau = 1; x = x + tau*pn;
    oldfn = fn; fn = feval(fun,x); y = fn - oldfn; oldBn = Bn;
    yp = oldBn*y - pn; pB = pn'*oldBn;
    for k = 1:n
        for j = 1:n, M(k,j) = yp(k)*pB(j); end
    end
    Bn = oldBn - M./(pn'*oldBn*y);
end
end
