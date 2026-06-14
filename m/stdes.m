function [xm,k,fm] = stdes(f,df,x0,tol,kmax)
% Steepest descent 방법을 이용하여 함수 f의 최소값을 계산
% df: f의 1차미분(기울기), x0: 초기값(열벡터)
iter = 1; x = x0; k = 1;
while (k < kmax)
    f1 = feval(f,x); g = feval(df,x); z = norm(g);
    if z == 0, disp('기울기는 0.'), x, f1, break; end
    g = g/z; a1 = 0; a3 = 1; f3 = feval(f,x-a3*g);
    while (f3 >= f1)
        a3 = a3/2; f3 = feval(f,x-a3*g);
        if a3 < tol/2, disp('더 이상 향상되지 않음.'); xm = x; fm = f1; return;
        end
    end
    a2 = a3/2; f2 = feval(f,x-a2*g); h1 = (f2-f1)/a2; h2 = (f3-f2)/(a3-a2);
    h3 = (h2-h1)/a3; a0 = (a2-h1/h3)/2; f0 = feval(f,x-a0*g);
    if f0 < f3, a = a0; else, a = a3; end
    x = x - a*g; k = k+1;
end
xm = x; fm = f1;
end