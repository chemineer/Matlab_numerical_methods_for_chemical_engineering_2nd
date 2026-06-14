function [fit,sumfit] = fitness(objf,chrom,a,b)
% objf: 목적함수, chrom: 개체군, a,b: 실수값 범위
% fit: 각 크로모좀을 나타내는 실수값에서의 목적함수값 벡터, sumfit: fit 원소들의 합
rval = chreal(chrom,a,b); fit = feval(objf,rval); sumfit = sum(fit);
end