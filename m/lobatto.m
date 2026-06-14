function y = lobatto(fun,a,b,n)
% n-point Lobatto 방법에 의한 함수 fun의 적분
% a, b: 적분의 하한 및 상한
% y: 계산된 적분결과

qc = [];
for k = 0:n-1
    if n >= 2*k
        fnk = factorial(2*n-2*k); fnp = 2^n*factorial(k)*factorial(n-k)*factorial(n-2*k);

    qc(n-2*k+1) = (-1)^k*fnk/fnp;
end
end
% 다항식의 미분의 계수를 계산
qcd = [];
for k = 0:n-1
    if n >= 2*k, qcd(n-2*k+1) = (n-2*k)*qc(n-2*k+1); end
end
qcd(n) = 0;
% Lobatto 점들을 계산
x = roots(fliplr(qcd(2:n+1))); x1 = sort(x,'descend'); pv = zeros(size(x));
for k = 1:n+1, pv = pv + qc(k)*x.^(k-1); end % Lobatto 가중치를 계산
n = n+1; w = 2./(n*(n-1)*pv.^2); w = [2/(n*(n-1)); w; 2/(n*(n-1))];
x1 = (x*(b-a)+(a+b))/2; pts = [a; x1; b]; % 원래 적분구간 [a b]로 변환
y = (b-a)*w'*feval(fun,pts)/2; % 적분결과 계산
end