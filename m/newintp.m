function yi = newintp(x, y, xi)
    % n개 데이터 점들을 이용한 n-1차 Newton 안점작 다항식
    % input:

    % x: 독립변수 데이터, y: 종속변수 데이터
    % xi: 안점작 함수값을 계산할 독립변수 값
    % output:
    % yi: xi에서의 안점작 함수값

    n = length(x); m = length(xi);
    if length(y) ~= n, error('x와 y의 길이는 같아야 함.'); end
    a = zeros(n,n); a(:,1) = y(:); % y는 열벡터
    for j = 2:n
        for i = 1:n-j+1, a(i,j) = (a(i+1,j-1)-a(i,j-1))/(x(i+j-1)-x(i)); end
    end
    for k = 1:m
        xt = 1; yi(k) = a(1,1);
        for j = 1:n-1, xt = xt*(xi(k)-x(j)); yi(k) = yi(k)+a(1,j+1)*xt; end % 안점작 계산
    end
end