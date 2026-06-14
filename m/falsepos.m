function [x, iter] = falsepos(fun, x1, x2, tol, varargin)
% false position 방법에 의한 방정식의 풀이
% input
%   x1, x2: 함수값의 부호가 다른 두 출발점
%   tol: 수렴기준
% output
%   x: 해
%   iter: 반복계산 횟수

% 초기화
iter = 0; itermax = 100; f1 = fun(x1, varargin{:}); f2 = fun(x2, varargin{:});
if f1 < 0, xm = x1; fm = f1; xp = x2; fp = f2;
else, xm = x2; fm = f2; xp = x1; fp = f1;
end
iter = iter + 1; x = xp; x0 = xm;
% 반복계산 루프
while abs(x - x0) > tol && iter <= itermax
    x0 = x; x = xp - fp * (xm - xp) / (fm - fp); fv = fun(x, varargin{:});
    if fv < 0, xm = x; fm = fv;
    else, xp = x; fp = fv;
    end
    iter = iter + 1;
end
if iter >= itermax, disp('경고: 허용가능한 최대 반복계산 횟수에 도달함.'); end
end
