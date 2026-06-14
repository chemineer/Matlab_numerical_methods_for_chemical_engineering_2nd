function [x, iter] = wegstein(fun,x0,tol,varargin)
% Wegstein 방법에 의한 방정식의 풀이
% input
%   x0: 해의 초기 가정값, tol: 수렴기준, fun: 방정식 파일(x = g(x))
% output
%   x: 해, iter: 반복계산 횟수
x1 = x0; x2 = fun(x1,varargin{:}); iter = 1; itermax = 100;
while abs(x1 - x2) > tol && iter <= itermax % 반복계산 루프
    gx1 = fun(x1,varargin{:}); gx2 = fun(x2,varargin{:});
    x = (x1*gx2 - x2*gx1)/(x1-gx1-x2+gx2);
    x1 = x2; x2 = x;    % 해에 대한 새로운 근사
    iter = iter + 1;
end
if iter> itermax, disp('Warning: Maximum iterations reached.'); end
end
