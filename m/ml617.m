% usebarnLP.m
clear all;
c = [-2 -1 -4 0 0]; A = [1 1 1 1 0; 1 2 3 0 1]; b = [7 12]';
[xopt, blist, fopt] = barnLP(A,b,c,0.00005);
fprintf('목적함수 값 = %8.4f', fopt), i = 1; fprintf('최적해: ');
for j = blist, fprintf('(%1.0f) = %8.4f', j, xopt(i)); i = i+1; end
fprintf('다른 변수들은 모두 0.')
