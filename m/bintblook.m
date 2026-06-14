function yi = bintblook(x, y, xi)
    % binary table look: 선형 spline을 이용
    % input
    % x: 데이터 독립변수
    % y: 데이터 종속변수
    % xi: 종속변수를 읽을 독립변수
    % output
    % yi: xi에서의 종속변수 값

    n = length(x);
    if xi < x(1) | xi > x(n), error('Interpolation outside range'); end
    % binary 탐색
    ia = 1; ib = n;
    while (1)

        if ib - ia <= 1, break, end
        im = fix((ia + ib) / 2);
        if x(im) < xi, ia = im; else, ib = im; end
    end
    % 선형 안점작
    yi = y(ia) + (y(ia+1) - y(ia))/(x(ia+1) - x(ia))*(xi - x(ia));
end