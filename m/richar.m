function dyi = richar(fun,h,xi)
% Richardson 공식을 이용한 함수의 xi에서의 미분
% input
% fun: 미분하고자 하는 함수 이름
% h: 독립변수 구간
% xi: 미분을 계산하고자 하는 점
% output
% dyi: xi에서의 미분값

y2 = feval(fun, xi+h); y1 = feval(fun, xi-h); y2m = feval(fun, xi+h/2); y1m = feval(fun, xi-h/2);
gh = (y2 - y1)./(2*h); gh2 = (y2m - y1m)./h; dyi = gh2 + (gh2 - gh)/3;
end