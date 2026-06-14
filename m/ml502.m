% rlsmd.m
x0 = [2 1]'; % 미지 계수벡터의 실제값
nx = length(x0); x = zeros(nx,1); P = 100*eye(nx,nx); % 계수벡터 x 및 P 행렬의 초기값
for k = 1:100
    Ak = [k*0.01 1]; bk = Ak*x0 + 0.3*rand; % 시점 k에서의 종속변수 측정값
    [x,K,P] = rlsup(Ak,bk,x,P);
end
display('최종 파라미터 추정치: '), x % 최종 파라미터 추정치
display('실제 파라미터값: '), x0
