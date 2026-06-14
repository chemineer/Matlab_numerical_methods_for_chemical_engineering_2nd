function [xp,fp] = quadopt(f,x0,epsx)
% 포물선 안짐작을 이용한 최적화 계산
% input
% f: 최소값을 찾는 대상함수 f(x), x0: 초기 탐색구간, epsx: 수렴한계
% output
% xp: 최적점, fp: xp에서의 함수의 최소값

epsx = 1e-6; iter = 200; % 가능한 최대 반복계산 횟수
if length(x0) > 2, xs = x0(1:3); % 초기 탐색구간은 3점들로 주어짐
else
    if length(x0) == 2, a = x0(1); b = x0(2); % 초기 탐색구간은 2점들로 주어짐
    else, a = x0 - 10; b = x0 + 10; end % 초기 탐색구간이 하나의 점으로 주어짐
    xs = [a (a+b)/2 b];
end
fs = f(xs); [xp,fp] = quadmin(f,xs,fs,epsx,iter);
end