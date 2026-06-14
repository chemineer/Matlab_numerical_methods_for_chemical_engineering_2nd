function x = congr(A,b,x0,tol)
% 컬레 기울기 방법을 이용하여 선형 시스템 Ax=b를 풀이
% 호출예: x = congr(A,b,x0,tol)
% inputs:
%   A: positive definite 계수행렬
%   b: 방정식 시스템의 우변벡터
%   x0: 해 x의 초기 가정값(벡터)
%   tol: 시스템이 만족해야 하는 정확도
% output:
%   x: 얻어진 근사해

r0 = b - A*x0; v0 = r0; crit = 1;
while crit == 1
    t = dot(r0,r0)/dot(v0,A*v0); x1 = x0 + t*v0; xd = x1 - x0; r1 = r0 - t*A*v0;
    v1 = r1 + v0 * dot(r1,r1)/dot(r0,r0);
    if (abs(t) <= tol || dot(xd,xd) <= tol), crit = 0; end
    x0 = x1; r0 = r1; v0 = v1;
end
x = x1;
end