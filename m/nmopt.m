function [xp,fp] = nmopt(f,x0,epsx)
% Nelder-Mead 방법을 이용한 최적화
% 부함수 nmmin을 호출
% input
% f: 최소값을 찾는 대상함수 f(x), x0: 초기 탐색구간, epsx: 수렴한계
% output
% xp: 최적점, fp: xp에서의 함수의 최소값

iter = 200; n = length(x0);
if n == 1, [xp,fp] = quadopt(f,x0,epsx); return; end % 1차원: 포물선 안짐작 방법 이용

s = eye(n);
for i = 1:n
    i1 = i + 1;
    if i1 > n, i1 = 1; end
    xi = [x0; x0+s(i,:); x0+s(i1,:)]; fi = [feval(f,xi(1,:)); feval(f,xi(2,:)); feval(f,xi(3,:))];
    [x0,fp] = nmmin(f,xi,fi,epsx,iter);
    if n < 3, break; end % 2차원인 경우 반복계산은 불필요
end
xp = x0;
end