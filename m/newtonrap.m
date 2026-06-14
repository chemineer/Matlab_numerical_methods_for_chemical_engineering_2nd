function [x, iter] = newtonrap(fun,x0,tol,varargin)
% Newton-Raphson 방법에 의한 방정식의 풀이
% input
% x0: 초기 가정값
% tol: 수렴기준
% fun: 방정식 파일
% output
% x: 해
% iter: 반복계산 횟수

iter = 0; fv = fun(x0,varargin{:}); x = x0; x0 = x + 1; itermax = 100; % 초기화
while abs(x - x0) > tol & iter <= itermax % 반복계산 루프
    iter = iter + 1; x0 = x;
    if x ~= 0, dx = x/100; else, dx = 1/100; end % 미분을 위한 dx의 설정
    a = x - dx; fa = fun(a,varargin{:}); b = x + dx; fb = fun(b,varargin{:});
    % 미분
    df = (fb - fa)/(b - a);
    if df == 0, x = x0 + max(abs(dx),1.1*tol); % 해의 새로운 근사
    else, x = x0 - fv/df;
    end
    fv = fun(x,varargin{:});
end
if iter> itermax, disp('Warning: Maximum iterations reached.'); end
end
