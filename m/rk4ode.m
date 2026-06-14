function [tv,yv] = rk4ode(dyt,tspan,y0,h,varargin)
% rk4ode: 4차 Runge-Kutta 방법을 이용한 ode 시스템의 풀이
% input:
% dyt: ode들을 포함하는 파일 이름, tspan: 시간구간([ti,tf] = [t0 t1 ... tf])
% y0: 초기값, h: 시간구간 크기(step size)
% varargin(p1,p2,...): dyt에서 이용되는 추가적인 파라미터
% output:
% tv: 독립변수 벡터, yv: 종속변수 벡터

if nargin < 4, error('입력인수는 4개 이상이어야 함.'); end
if any(diff(tspan) <= 0), error('독립변수는 오름차순이어야 함'); end
n = length(tspan); ti = tspan(1); tf = tspan(n);
if n == 2
    t = (ti:h:tf)'; n = length(t);
    if t(n) < tf, t(n+1) = tf; n = n+1; end
else, t = tspan;
end
tt = ti; y(1,:) = y0; np = 1; tv(np) = tt; yv(np,:) = y(1,:); i = 1;
while(1)
    tend = t(np+1); hh = t(np+1) - t(np);
    if hh > h, hh = h; end
    while(1)
        if tt+hh > tend, hh = tend-tt; end
        k1 = dyt(tt,y(i,:),varargin{:})'; ymid = y(i,:) + k1*hh./2;
        k2 = dyt(tt+hh/2,ymid,varargin{:})'; ymid = y(i,:) + k2*hh/2;
        k3 = dyt(tt+hh/2,ymid,varargin{:})'; yend = y(i,:) + k3*hh;
        k4 = dyt(tt+hh,yend,varargin{:})'; phi = (k1+2*(k2+k3)+k4)/6;
        y(i+1,:) = y(i,:) + phi*hh; tt = tt+hh; i = i+1;
        if tt >= tend, break; end
    end
    np = np+1; tv(np) = tt; yv(np,:) = y(i,:);
    if tt >= tf, break; end
end
end
