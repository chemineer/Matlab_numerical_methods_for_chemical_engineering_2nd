function [xopt,blist,fopt] = barnLP(A,b,c,tol)
% 선형계획 문제를 풀기 위한 Barnes 방법
% Minimize c'x subject to Ax = b.
% 문제는 non-degenerate라고 가정.
% Inputs:
%   A: 제약조건들의 계수들의 행렬, b: 우변의 열 벡터, c: 목적함수의 계수들의 행벡터.
% Outputs:
%   xopt: 해 벡터, blist: basic 변수들의 목록, fopt: 목적함수 값
x2 = [ ]; x = [ ]; [m n] = size(A); % 초기화
ap1 = b - sum(A(1:m,:)')'; cpl = 1000000;
A = [A ap1]; c = [c cpl]; B = [ ]; n = n+1; x0 = ones(1,n)'; x = x0;
alpha = 0.0001; lambda = zeros(1,m)'; iter = 0;
while abs(c*x - lambda'*b) > tol
    x2 = x.*x; D = diag(x); D2 = diag(x2); AD2 = A*D2;
    lambda = (AD2*A')\(AD2*c'); dlres = c' - A'*lambda; nmres = norm(D*dlres);
    for i = 1:n
        if dlres(i) > 0, ratio(i) = nmres/(x(i)*(c(i)-A(:,i)'*lambda));
        else, ratio(i) = inf; end
    end
    R = min(ratio) - alpha; x1 = x - R*D2*dlres/nmres;
    x = x1; bcount = 0; B = [ ]; blist = [ ]; cb = [ ];

    for k = 1:n
        if x(k) > tol, bcount = bcount+1; blist = [blist k]; end
    end
    if bcount == m % 문제가 non-degenerate일 때에만 해당
        for k = blist, B = [B A(:,k)]; cb = [cb c(k)]; end
        psol = b'/B'; xopt = psol; break;
    end
    iter = iter + 1;
end
xopt = x(blist); fopt = c*x;
end