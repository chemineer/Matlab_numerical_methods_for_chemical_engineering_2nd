function [xval,maxf] = optga(objf,range,nbit,nchrom,gens,mu,mrat)
% 유전자 알고리즘을 이용하여 함수의 최대값을 규명
% inputs:
%   objf: 목적함수(사용자 정의 1변수 양수함수)의 이름
%   range: 목적함수의 독립변수 x에 대한 하한 및 상한을 나타내는 2원소 행벡터
%   nbit: 변수에 대한 비트 수(개체군 행렬의 열)
%   nchrom: 개체군 크기(크로모좀들의 수로서 개체군 행렬의 행)
%   gens: 세대 수, mu: 돌연변이 비율, mrat: 0에서 1 범위의 교배되는 부분
% outputs:
%   xval: 최적점의 실수값, maxf: 최대 목적함수 값
newpop = []; a = range(1); b = range(2);
newpop = genbin(nbit,nchrom); % 새로운 개체군을 생성
for i = 1:gens
    selpop = selectga(objf,newpop,a,b); % 적합도에 따른 크로모좀 선택
    newgen = matecrm(selpop,mrat); % 교배
    chrom = mutate(newgen,mu); % 돌연변이
    newpop = chrom; nc = chreal(newpop,a,b);
    gind = i*ones(1,nchrom);
    plot(gind, nc, 'o'), hold on
end
hold off, axis([0 gens,a,b])
xlabel('Generations'), ylabel('Real values at each genration')
[fit,sumfit] = fitness(objf,newpop,a,b); % 적합도 계산
[maxf,indf] = max(fit); % indf: 적합도가 가장 큰 크로모좀 인덱스
xval = chreal(newpop(indf,:),a,b);
end