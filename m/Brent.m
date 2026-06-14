function b = Brent(func,xa,xb,varargin)
% Brent 방법에 의한 방정식(func)의 풀이
% 탐색구간: [xa xb]

tol = 1e-6; a = xa; b = xb; fa = feval(func,a,varargin{:}); fb = feval(func,b,varargin{:});
c = a; fm = fa; d = b - c; e = d;
while (1)
    if fb == 0, return; end
    if sign(fa) == sign(fb) % 필요할 경우 점들을 재배열
        a = c; fa = fm; d = b - c; e = d;
    end
    if abs(fa) < abs(fb), c = b; b = a; a = c; fm = fb; fb = fa; fa = fm; end
    m = (a - b)/2; tol = 2*eps*max(abs(b), 1);
    if abs(m) <= tol || fb == 0., break; end
    % bisection 방법을 적용
    if abs(e) >= tol && abs(fm) > abs(fb)
        s = fb/fm;
        if a == c, p = 2*m*s; q = 1 - s;
        else % 역 2차 안짐작
            q = fm/fa; r = fb/fa; p = s * (2*m*q * (q - r) - (b - c)*(r - 1));
            q = (q - 1)*(r - 1)*(s - 1);
        end
        if p > 0, q = -q; else p = -p; end
        if 2*p < 3*m*q - abs(tol*q) && p < abs(e*q/2), e = d; d = p/q;
        else, d = m; e = m; end
    else, d = m; e = m; % Bisection 방법
    end
    c = b; fm = fb;
    if abs(d) > tol, b = b+d;
    else, b = b - sign(b-a)*tol; end
    fb = feval(func,b,varargin{:});
end
end
