function [x, y, iter] = muller(fun,x1,x2,kmax,tol,varargin)
% Mullert 방법에 의한 방정식의 풀이
% input:
% fun: 방정식, x1,x2: 두 시작점. 세 번째 시작점은 (x1+x2)/2
% tol: 수렴한계, kmax: 허용 가능한 최대 반복계산 횟수
% output:
% x: 근사해(행벡터), y: x에서의 함수값 fun(x), iter: 반복계산 횟수

x3 = (x1 + x2)/2; y1 = feval(fun,x1,varargin{:}); y2 = feval(fun,x2,varargin{:});
y3 = feval(fun,x3,varargin{:}); c1 = (y2 - y1)/(x2 - x1);
for k = 3:kmax
    c2 = (y3 - y2)/(x3 - x2); d1 = (c2 - c1)/(x3 - x1); s = c2 + d1*(x3 - x2);
    x4 = x3 - 2*y3/(s + sign(s)*sqrt(s^2 - 4*y3*d1)); y4 = feval(fun,x4,varargin{:});
    if abs(x4 - x3) < tol, disp('Muller 방법은 수렴값에 도달함.'); break; end
    c1 = c2; x1 = x2; x2 = x3; x3 = x4; y1 = y2; y2 = y3; y3 = y4; iter = k; % update
end
x = x4; y = y4;
end
