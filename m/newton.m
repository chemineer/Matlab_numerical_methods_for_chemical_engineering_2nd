function [xnew, iter] = newton(fun,x0,rho,varargin)
% Newton 방법에 의한 방정식의 풀이
% input:
% x0: 초기값(열 벡터)
% fun: 방정식
% rho: 완화인자(relaxation factor)
% output:
% xnew: 해
% iter: 반복계산 횟수

tol = 1e-6; nx = length(x0); x = x0 * 1.1; xnew = x0; iter = 0; maxiter = 100;
% 반복계산 루프
while max(abs(x - xnew)) > tol && iter < maxiter
    iter = iter + 1; x = xnew; fv = feval(fun,x,varargin{:});
    for k = 1:nx % 수치미분을 위한 dx의 설정
        if x(k) ~= 0, dx(k) = x(k) / 100; else, dx(k) = 1/100; end


    end
    % Jacobian 행렬의 계산
    a = x; b = x;
    for k = 1:nx
        a(k) = a(k) - dx(k); fa = feval(fun,a,varargin{:});
        b(k) = b(k) + dx(k); fb = feval(fun,b,varargin{:});
        jacob(:,k) = (fb - fa) / (b(k) - a(k)); a(k) = a(k) + dx(k); b(k) = b(k) - dx(k);
    end
    % 해의 새로운 근사
    if det(jacob) == 0, xnew = x + max(abs(dx), 1.1*tol);
    else, xnew = x - rho * inv(jacob) * fv;
    end
end
if iter >= maxiter, disp('Warning: Maximum iterations reached.'); end
end
