function y = tzint(func,a,b,n,varargin)
% Trapezoidal 수치적분 규칙
% input
% func: 피적분 함수 이름
% a, b: 적분의 하한과 상한
% n: 구간 수(디폴트는 100)
% output
% y: 적분 추정값

if ~(b > a), error('적분 상한이 하한보다 커야 함'); end
if isempty(n), n = 100; end % n이 지정되지 않으면 100으로 설정
x = a; h = (b - a)/n; s = func(a,varargin{:});
for i = 1:n-1, x = x + h; s = s + 2*func(x,varargin{:}); end
s = s + func(b,varargin{:}); y = (b - a) * s/(2*n);
end