function [x, fv, re, iter] = bisec(fun, xa, xb, crit, maxi, varargin)
% Bisection 방법을 이용한 방정식의 풀이
%※ 사용방법: [x, fv,re, iter] = bisec (fun, xa, xb, crit, maxi, varargin)
%input
%fun: 방정식을 포함하는 함수 이름, xa: 초기 풀이구간의 하한
%xb: 초기 풀이구간의 상한, crit: 오차기준, maxi: 가능한 최대 반복계산 횟수
%output
% 결과로 얻어지는 해, fv: 해에서의 함수값, re: 오차(%)
%iter: 반복계산 횟수
fsign = fun(xa,varargin{:})*fun(xb,varargin{:});


if fsign > 0, error('함수의 부호가 동일: 이 구간에 해가 존재하지 않음'); return; end
iter = 0; xm = xa; re = 100;
while (iter < maxi)
xmold = xm; xm= (xa + xb)/2; iter = iter + 1;
if xm ~= 0, re = abs((xm - xmold)/xm)*100; end % 상대오차
fsign= fun(xa,varargin{:})*fun(xm,varargin{:});
if fsign < 0, xb =xm; %해는 [xa xm] 내에 위치

elseif fsign >0, xa =xm; % 해는 [xm xb] 내에 위치
else re= 0;
end
if (re <= crit) || (iter >= maxi), break; end
x = xm; fv= fun(xm,varargin{:});
end

end
