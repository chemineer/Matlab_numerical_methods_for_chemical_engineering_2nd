function [x, iter] = sucsub(fun,x0,tol,varargin)
% 연속치환법에 의한 방정식의 풀이
% input
%   x0: 초기 가정값, tol: 수렴기준, fun: 방정식 파일(x = g(x))
% output
%   x: 해, iter: 반복계산 횟수

x = x0; x0 = x + 1; iter = 1; itermax = 100;
% 반복계산 루프
while abs(x - x0) > tol && iter <= itermax
    x0 = x; fv = fun(x0, varargin{:}); x = fv; % 해에 대한 새로운 근사
    iter = iter + 1;
end
if iter >= itermax, disp('Warning : Maximum iterations reached.'); end
end
