function [xm,k,fm] = dfpopt(f,df,x0,tol,kmax)
% Davidon-Fletcher-Powell(DFP) 방법을 이용하여 함수 f의 최소값을 계산
% df: f의 1차미분(기울기), x0: 초기값(열벡터)
x = x0'; n = length(x); H = eye(n); fv = feval(f,x); g = feval(df,x);
for k = 1:kmax
    s = -H*g; f1 = fv; z = norm(s);
    if z == 0, disp('기울기는 0.'), xm = x; fm = f1; return; end
    s = s/z; a1 = 0; a3 = 1; f3 = feval(f,x+a3*s);
    while (f3 >= f1)
        a3 = a3/2; f3 = feval(f,x+a3*s);
        if a3 < tol/2, disp('더 이상 향상되지 않음.'); xm = x; fm = f1; return;
    end
end
a2 = a3/2; f2 = feval(f,x+a2*s); h1 = (f2-f1)/a2; h2 = (f3-f2)/(a3-a2);
h3 = (h2-h1)/a3; a0 = (a2-h1/h3)/2; f0 = feval(f,x+a0*s);
if f0 < f3, a = a0; else, a = a3; end
d = a*s; xn = x + d; fn = feval(f,xn); gn = feval(df,xn); y = (gn - g);
A = (d*d')/(d'*y); B = (H*y)*(H*y)'/(y'*H*y);
Hn = H + A - B;
if abs(d) < tol, disp('수렴에 도달함.'); break; end
H = Hn; fv = fn; g = gn; x = xn;
end
xm = x; fm = fv;
end