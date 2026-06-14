% saex.m
f = @(x) x(1).^4 - 16*x(1).^2 - 5*x(1) + x(2).^4 - 16*x(2).^2 - 5*x(2);
lb = [-5 -5]; ub = [5 5]; x0 = [0 0]; kmax = 500; q = 1; tolf = 1e-6;
disp('Simulated annealing 방법:'), [xs,fs] = simanopt(f,x0,lb,ub,kmax,q,tolf)
disp('MATLAB 내장함수(fminsearch)에 의한 결과:'), [xm,fm] = fminsearch(f,x0)
