function x = fixpt(fun,x0,tol,kmax)
% Fixed-point 방법(연속치환법)에 의한 방정식 시스템의 풀이
% input
% fun: x=f(x) 형태로 정리된 함수(우변의 f(x))
% x0: 초기값 가정 벡터(행벡터)
% tol: 수렴기준, kmax: 허용 가능한 최대 반복계산 횟수
% output
% x: 해

% 초기화
y = feval(fun,x0); x1 = y'; diff = norm(x1 - x0);
if diff <= tol, x = x1; return;
else, x0 = x1; end

    iter = 2;
    while (iter <= kmax)
        y = feval(fun,x0); x1 = y'; diff = norm(x1 - x0);
        if diff <= tol, x = x1; return;
        else, x0 = x1; end
        iter = iter + 1;
    end
end
