function chromosome = genbin(nbit, nchrom)
% nbit: 각 열의 원소 수(크로모좀 1개의 길이), nchrom: 생성되는 크로모좀들의 수
% chromosome: 생성되는 (nchrom x nbit) 행렬 (원소들은 0이나 1)
maxchros = 2^nbit;
if nchrom >= maxchros, nchrom = maxchros; end
chromosome = round(rand(nchrom, nbit));
end