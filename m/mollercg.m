function [xopt, fm, iter] = mollercg(f, derf, x, tol)
% Moller의 켤레 기울기 방법(Conjugate gradient method)을 이용하여
% n 변수 비선형 함수의 국부적 최소값을 계산
% input:
%   f: 사용자 정의 함수, derf: f에 대한 n개의 1차 편미분들
%   x: n 출발값들의 열벡터, tol: 요구되는 정확도
% output:
%   xopt: 해, iter: 소요되는 반복과정 수

lambda = 1e-8; lambdabar = 0; sigmac = 1e-5; sucess = 1;
deltastep = 0; [n m] = size(x); iter = 0;

pv = -feval(derf,x); rv = pv; % 초기 기울기의 계산
while norm(rv) > tol
    iter = iter+1;
    if deltastep == 0, df = feval(derf,x); else, df = -rv; end
    deltastep = 0;
    if sucess == 1
        sigma = sigmac/norm(pv); dfplus = feval(derf, x+sigma*pv);
        stilda = (dfplus-df)/sigma; delta = pv'*stilda;
    end
    delta = delta + (lambda-lambdabar)*norm(pv)^2; % Scale
    if delta <= 0
        lambdabar = 2*(lambda-delta/norm(pv)^2);
        delta = -delta + lambda*norm(pv)^2; lambda = lambdabar;
    end
    % Step size
    mu = pv'*rv; alpha = mu/delta; fv = feval(f,x);
    fvplus = feval(f,x+alpha*pv); delta1 = 2*delta*(fv-fvplus)/mu^2;
    rvold = rv; pvold = pv;
    if delta1 >= 0
        deltastep = 1; x1 = x + alpha*pv;
        rv = -feval(derf,x1); lambdabar = 0; sucess = 1;
        if rem(iter,n) == 0, pv = rv;
        else
            rdiff = rv - rvold; beta = (rdiff'*rv)/(rvold'*rvold);
            pv = rv + beta*pvold;
        end
        if delta1 >= 0.75, lambda = 0.25*lambda; end
    else
        lambdabar = lambda; sucess = 0; x1 = x + alpha*pv;
    end
    if delta1 < 0.25, lambda = lambda + delta*(1-delta1)/norm(pvold)^2; end
    x = x1;
end
xopt = x1; fm = feval(f,xopt);
end