function xh = lincg(a,b,n,tol)
% 켤레 기울기 방법을 이용하여 선형 시스템 ax=b를 풀이
% 호출예: xdash = lincg(a,b,n,tol)
% a: n x n 양수확정 행렬, b: n 계수들의 벡터
% tol: 시스템이 만족해야 하는 정확도
% 주의: 대규모의 불량조건(ill-conditioned) 시스템의 경우 정확도가 떨어진다.
xh = [ ]; gh = [ ]; dh = [ ]; qh = [ ]; q = [ ];
mxitr = n*n; xh = zeros(n,1); gh = -b; dh = -gh;
mnit = b'*b; crit = 1; k = 0; mu = mnit;
% main stage
while crit == 1
    qh = a*dh; q = qh; r = dh'*q;
    if r == 0, error('r=0, divide by 0!!!'); end
    s = mu/r; xh = xh + s*dh; gh = gh + s*q;
    t = gh'*qh; beta = t/r; dh = -gh + beta*dh; mu = beta*mu;
    k = k+1; val = a*xh;
    if ((1-val'*b/(norm(val)*norm(b))) <= tol) && (mu/mnit <= tol), crit = 0; end
    if k > mxitr, crit = 0; end
end
end