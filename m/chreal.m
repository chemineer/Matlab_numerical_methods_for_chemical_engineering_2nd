function rval = chreal(chrom,a,b)
% 개체군의 각 행(binary string)을 a에서 b 범위의 실수값으로 전환
% chrom: 개체군, a, b: 실수값 범위
% rval: 개체군의 각 행에 해당하는 실수값으로 이루어지는 벡터
[nr nbit] = size(chrom);
for i = 1:nr, rval(i) = rch(chrom(i,:),a,b); end
end