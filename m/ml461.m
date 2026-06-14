% femlaplace.m
m = 12; n = 4; p = 14; % m: 총 노드, n: 내부 노드, p: 삼각형 소영역들의 수
V = [1/2 1/2; 1 1; 3/2 1/2; 1/2 3/2; 0 0; 1 0; 2 0; 2 1; 3/2 3/2; 1 2; 0 2; 0 1];
S = [1 5 12; 1 5 6; 1 2 6; 1 2 12; 3 2 6; 3 6 7; 3 7 8; 3 8 2; 2 8 9; 2 9 10;...
     4 11 12; 4 12 2; 4 2 10; 4 10 11];
for j = 1:m
    for k = 1:p
        for i = 1:3
            A2(i,1) = 1; A2(i,2) = V(S(k,i),1); A2(i,3) = V(S(k,i),2);
            if S(k,i) == j, b2(i,1) = 1; else, b2(i,1) = 0; end
        end
        x = A2\b2; A(j,k) = x(1); B(j,k) = x(2); C(j,k) = x(3);
    end
end
H = 0.25*ones(1,p); cf = [0 0 0 0 0 0 0 1 1 1 0 0]; % H:삼각형 면적, cf:계수벡터
for i = 1:n
    for j = 1:n, q(1:p) = B(i,1:p).*B(j,1:p) + C(i,1:p).*C(j,1:p); A3(i,j) = q*H';
    end
end
for i = 1:n
    for j = n+1:m
        k = j-n; q(1:p) = B(i,1:p).*B(j,1:p) + C(i,1:p).*C(j,1:p); G(i,k) = q*H';
    end
end

d(1:n) = -G*cf(n+1:m)'; cf(1:n) = A3\d';
Ua = A'*cf'; Ub = B'*cf'; Uc = C'*cf'; U = [Ua Ub Uc]
xg = V(:,1); yg = V(:,2); trimesh(S,xg,yg,cf)
