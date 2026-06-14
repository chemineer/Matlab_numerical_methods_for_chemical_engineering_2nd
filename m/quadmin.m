function [xp,fp] = quadmin(f,xs,fs,epsx,iter)
% 포물선 안짐작을 이용한 최적화 계산의 수행
% input
% f: 최소값을 찾는 대상함수 f(x), xs: 탐색구간(3점)
% fs: 탐색구간 점들에서의 함수값, epsx: 수렴한계
% output
% xp: 최적점, fp: xp에서의 함수의 최소값

x1 = xs(1); x2 = xs(2); x3 = xs(3); f1 = fs(1); f2 = fs(2); f3 = fs(3);
fc = [f1-f3 f2-f1 f3-f2]*[x2*x2 x3*x3 x1*x1; x2 x3 x1]'; xq = fc(1)/fc(2)/2;
fq = feval(f,xq);
if (iter <= 0 || abs(xq-x2) < epsx || abs(fq-f2) < epsx), xp = xq; fp = fq;
else
    if xq < x2
        if fq < f2, xs = [x1 xq x2]; fs = [f1 fq f2];
        else, xs = [xq x2 x3]; fs = [fq f2 f3]; end
    else
        if fq <= f2, xs = [x2 xq x3]; fs = [f2 fq f3];
        else, xs = [x1 x2 xq]; fs = [f1 f2 fq]; end
    end
    [xp,fp] = quadmin(f,xs,fs,epsx,iter-1);
end
end