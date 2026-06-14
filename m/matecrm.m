function chr1 = matecrm(chrom,mrat)
% chrom 크로모좀들의 matenum 부분을 교배
% chrom: 크로모좀 개체군, mrat: 교배되는 비율(0에서 1 사이)
% chr1: 교배되어 생성된 새로운 크로모좀 개체군
mind = []; chr1 = chrom; [nr nbit] = size(chrom); ind = 1:nr;
u = floor(nr*mrat); % 교배되는 크로모좀들의 수
if floor(u/2) ~= u/2, u = u-1; end % 교배되는 크로모좀들의 수는 짝수
while length(mind) ~= u % 무작위 교배 비율을 선택
    i = round(rand*nr); % 임의의 크로모좀을 선택
    if i == 0, i = 1; end
    if ind(i) ~= -1, mind = [mind i]; ind(i) = -1; end % 동일한 크로모좀의 선택을 방지
end
for i = 1:2:u-1 % 단일점 교차를 수행
    mpos = floor(rand*nbit); % 교배되는 부분의 시작비트 위치
    if mpos == 0, mpos = 1; end
    i1 = mind(i); i2 = mind(i+1); % 교배되는 두 크로모좀들의 인덱스
    mgene = chrom(i1,mpos+1:nbit); chr1(i1,mpos+1:nbit) = chrom(i2,mpos+1:nbit);
    chr1(i2,mpos+1:nbit) = mgene;
end
end