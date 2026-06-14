function [xp,fp] = nmmin(f,xi,fi,epsx,iter)
% Nelder-Mead 방법을 이용한 최적화 계산의 수행
% input
% f: 최소값을 찾는 대상함수 f(x), xi: 탐색구간
% fi: 탐색구간 점들에서의 함수값, epsx: 수렴한계
% output
% xp: 최적점, fp: xp에서의 함수의 최소값

[fi,I] = sort(fi); a = xi(I(1),:); b = xi(I(2),:); c = xi(I(3),:); fa = fi(1);
fb = fi(2); fc = fi(3);
fba = fb-fa; fcb = fc-fb;
if (iter <= 0 || abs(fba)+abs(fcb) < epsx || abs(b-a)+abs(c-b) < epsx), xp = a;
fp = fa;
else
    m = (a+b)/2; e = 3*m-2*c; fe = feval(f,e);
    if fe < fb, c = e; fc = fe;
    else
        r = (m+e)/2; fr = feval(f,r);
        if fr < fc, c = r; fc = fr; end
        if fr >= fb
            s = (c+m)/2; fs = feval(f,s);
            if fs < fc, c = s; fc = fs;
            else, b = m; c = (a+c)/2; fb = feval(f,b); fc = feval(f,c); end
        end
    end
    [xp,fp] = nmmin(f,[a;b;c],[fa fb fc],epsx,iter-1);
end
end