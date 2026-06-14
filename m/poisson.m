function u = poisson(f,f0,f1,g0,g1,n,m,iter)
% poisson: Poisson PDE의 풀이
% input:
%   f: PDE의 우변항
%   f0,f1: 경계조건 (u(x,0)=f0(x), u(x,1)=f1(x))
%   g0,g1: 경계조건 (u(0,y)=g0(y), u(1,y)=g1(y))
%   n,m: x 및 y에 대한 소구간 수, iter: 최대 반복계산 횟수
% output:
%   z: 계산결과

h = 1/n; k = 1/m; % x 및 y 방향구간 길이
r = (h/k)^2; c = 1/(2*r + 2); d = r*c; b = c*h^2;
x = 1:1:(n-1); x = h*x; y = 1:1:(m-1); y = k*y; % 격자점들의 생성
% 경계조건 계산
w0(1:m-1) = feval(g0,y(1:m-1)); w1(1:m-1) = feval(g1,y(1:m-1));
v0(1:n-1) = feval(f0,x(1:n-1)); v1(1:n-1) = feval(f1,x(1:n-1));
% 우변항 계산
for i = 1:n-1, F(i,1:m-1) = b*feval(f,x(i),y(1:m-1)); end
w = zeros(n-1,m-1); % 초기화
for it = 1:iter
  % 4변과 4꼭지점에서의 해
  w(1,1) = d*(w(1,2) + v0(1)) + c*(w(2,1) + w0(1)) - F(1,1);
  w(1,m-1) = d*(v1(1) + w(1,m-2)) + c*(w(2,m-1) + w0(m-1)) - F(1,m-1);
  w(n-1,1) = d*(w(n-1,2) + v0(n-1)) + c*(w1(1) + w(n-2,1)) - F(n-1,1);
  w(n-1,m-1) = d*(v1(n-1) + w(n-1,m-2)) + c*(w1(m-1) + w(n-2,m-1)) - F(n-1,m-1);
  w(2:n-2,1) = d*(w(2:n-2,2) + v0(2:n-2)') + c*(w(3:n-1,1) + w(1:n-3,1))- F(2:n-2,1);
  w(2:n-2,m-1) = d*(v1(2:n-2)'+w(2:n-2,m-2))+c*(w(3:n-1,m-1)+w(1:n-3,m-1))-F(2:n-2,m-1);
  w(1,2:m-2) = d*(w(1,3:m-1) + w(1,1:m-3)) + c*(w(2,2:m-2) + w0(2:m-2))- F(1,2:m-2);
  w(n-1,2:m-2) = d*(w(n-1,3:m-1)+w(n-1,1:m-3))+c*(w1(2:m-2)+w(n-2,2:m-2))- F(n-1,2:m-2);
  % 내부 노드에서의 해
  for j = 2:m-2
    w(2:n-2,j) = d*(w(2:n-2,j+1) + w(2:n-2,j-1)) + c*(w(3:n-1,j) + w(1:n-3,j)) - F(2:n-2,j);
  end
end
% 풀이결과
v0w0 = (feval(f0,0) + feval(g0,0))/2; v0w1 = (feval(f0,1) + feval(g1,0))/2;
v1w0 = (feval(g0,1) + feval(f1,0))/2; v1w1 = (feval(f1,1) + feval(g1,1))/2;
z = w'; z = [w0' z w1']; wv = [v0w0 v0 v0w1]; wd = [v1w0 v1 v1w1];
u = [wv; z; wd]; xv = 0:n; yv = 0:m;
mesh(xv,yv,u), xlabel('x'), ylabel('y'), zlabel('u')
end