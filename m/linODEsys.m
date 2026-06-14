function y = linODEsys(A,y0,t,t0,method)
% 계수행렬 A, 초기조건이 t0에서 y0인 시스템의 풀이(t0의 default 값은 0)
% 시간 t에서의 해 y를 반환
% method=1: 지수행렬(e^At) 방법 (default)
% method=2: 고유벡터 방법
t = t - t0; nt = length(t); nA = length(A);
if nA ~= length(y0), error('계수행렬과 초기값 벡터의 차원이 같지 않음'); end
y0 = (y0(:).')'; % 초기값 벡터는 열벡터임을 확인
switch method
case 1 % 지수행렬 방법
    for k = 1:nt
        if t(k) > 0, y(:,k) = expm(A*t(k))*y0; else, y(:,k) = y0; end
    end
case 2 % 고유벡터 방법
    [P,D] = eig(A); % 고유벡터(P)와 고유치(D)
    IP = inv(P); elambdat = zeros(nA,nA,nt);
    for k = 1:nA, elambdat(k,k,:) = exp(D(k,k) * t); end % 행렬 exp(LAMBDA.t)를 구축
    % 방정식 시스템의 풀이
    for k = 1:nt
        if t(k) > 0, y(:,k) = P*elambdat(:,:,k)*IP*y0; else, y(:,k) = y0; end
    end
end