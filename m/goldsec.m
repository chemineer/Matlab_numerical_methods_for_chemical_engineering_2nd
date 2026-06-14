function [f,a,iter] = goldsec(func,p,tol)
% 1변수 비선형 함수의 최소점을 찾는 Golden search
% input:
% func: 사용자 정의 비선형 함수
% p: 탐색범위를 나타내는 2원소 벡터, tol: tolerance
% output:
% a: 함수의 최적점, f: 함수의 최소값, iter: 반복횟수

if p(1) < p(2), a = p(1); b = p(2); else, a = p(2); b = p(1); end
g = (-1+sqrt(5))/2; r = b-a; iter = 0;
while r > tol
    x = [a+(1-g)*r a+g*r]; y = feval(func,x);
    if y(1) < y(2), b = x(2); else, a = x(1); end
    r = b-a; iter = iter+1;
end
f = feval(func,a);
end