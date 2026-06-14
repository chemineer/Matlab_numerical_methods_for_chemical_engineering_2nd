% solvbspde.m: Black-Scholes PDE의 풀이
function solvbspde

m = 0; r = 0.065; sigma = 0.8;
k = r/(0.5*sigma^2); a = log(2/5); b = log(7/5);
t0 = 0; tf = 5;
xmesh = linspace(a,b,40); tspan = linspace(t0,tf,20);
sol = pdepe(m,@bspde,@bsic,@bsbc,xmesh,tspan);
u = sol(:,:,1); mesh(xmesh,tspan,u)
xlabel('x','FontSize',12), ylabel('t','FontSize',12), zlabel('u','FontSize',12,'Rotation',0)

function [c,f,s] = bspde(x,t,u,DuDx)  % 중첩함수
% BSPDE Black-Scholes PDE.
c = 1; f = DuDx; s = (k-1)*DuDx-k*u;
end

function u0 = bsic(x)  % 중첩함수
% BSIC  t = t0 에서의 초기조건.
u0 = max(exp(x)-1,0);
end

function [pa,qa,pb,qb] = bsbc(xa,ua,xb,ub,t) % 중첩함수
% BSBC  x = a 와 x = b 에서의 경계조건.
pa = ua; qa = 0; pb = ub - (7 - 5*exp(-k*t))/5; qb = 0;
end
end
