function yi = lagrintp(x, y, xi)
    % n개 데이터를 이용한 n-1차 Lagrange 안점작 다항식 계산
    % input:
    % x: n개 독립변수 데이터, y: n개 종속변수 데이터, xi: 안점작을 계산할 독립변수 벡터
    % output:
    % yi: xi에서 계산된 안점작 종속변수 벡터

    n = length(x); sum = 0;
    if length(y) ~= n, error('x와 y의 길이는 같아야 함.'); end
    for i = 1:n
        pr = y(i);
        for j = 1:n
            if i ~= j, pr = pr .* (xi - x(j)) ./ (x(i) - x(j)); end
        end
        sum = sum + pr;
    end
    yi = sum;
end