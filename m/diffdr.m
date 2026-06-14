function dy = diffdr(a,h,n,m,f)
% 차분을 이용한 함수 f의 x=a에서의 미분
% Inputs:
%   a: 미분을 계산하는 점, h: 구간 크기, n: 차분점들의 수

%   m: 근사 형태
%      m=-1: n-점 backward 차분 (n=2,3,4)
%      m=0: n-점 central 차분 (n=2,4)
%      m=1: n-점 forward 차분 (n=2,3,4)
%   h: 바깥짐작 파라미터
%   f: 미분되는 함수
% Outputs:
%   dy: x=a에서의 df(x)/dx

if m < 0 % backward 차분
    switch n
        case 2, dy = f(a) - f(a-h);
        case 3, dy = (3*f(a) - 4*f(a-h) + f(a-2*h))/2;
        case 4, dy = (11*f(a) - 18*f(a-h) + 9*f(a-2*h) - 2*f(a-3*h))/6;
    end
elseif m == 0 % central 차분
    switch n
        case 2, dy = (f(a+h) - f(a-h))/2;
        case 3, dy = (f(a+h) - f(a-h))/2;
        case 4, dy = (f(a-2*h) - 8*f(a-h) + 8*f(a+h) - f(a+2*h))/12;
    end
else % forward 차분
    switch n
        case 2, dy = -f(a) + f(a+h);
        case 3, dy = (-3*f(a) + 4*f(a+h) - f(a+2*h))/2;
        case 4, dy = (-11*f(a) + 18*f(a+h) - 9*f(a+2*h) + 2*f(a+3*h))/6;
    end
end
dy = dy/h;
end