function [f,e] = newtonquad(fi,x,y)
    % newtonquad.m: Newton 2차식 안점작
    % input:
    % fi: 3개의 data point(1열: 독립변수, 2열: 종속변수)
    % x: 함수값을 구하고자 하는 독립변수 값
    % y: x에서의 실제 함수값 데이터
    % output:
    % f: x에서의 안점작 함수값, e: 상대오차

    ti = fi(:,1); % 1열: 독립변수 데이터
    ft = fi(:,2); % 2열: 종속변수 데이터
    % 2차식 계수의 계산
    a0 = ft(1); a1 = (ft(2)-ft(1))./(ti(2)-ti(1));
    a2 = ((ft(3)-ft(1))./(ti(3)-ti(1)) - (ft(2)-ft(1))./(ti(2)-ti(1)))./(ti(3)-ti(2));
    f = a0 + a1*(x - ti(1)) + a2*(x-ti(1)).*(x-ti(2)); % x에서의 함수값 계산
    e = 100*(y-f)./y; % 상대오차(%) 계산
end