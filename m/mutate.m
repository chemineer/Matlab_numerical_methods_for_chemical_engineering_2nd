function chrom = mutate(chrom,mu)
% mu로 주어지는 비율에서 chrom을 돌연변이시킨다.
[nr nbit] = size(chrom);
for i = 1:nr
    for j = 1:nbit
        if rand <= mu
            if chrom(i,j) == 1, chrom(i,j) = 0;
            else, chrom(i,j) = 1; end
        end
    end
end
end