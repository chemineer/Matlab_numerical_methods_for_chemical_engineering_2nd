function newchrom = selectga(objf,chrom,a,b)
% chrom으로부터 다음 세대를 위한 최선의 크로모좀들을 선택
% objf: 목적함수, chrom: 개체군, a,b: 실수값 범위, newchrom: 선택된 새로운 크로모좀
[nr nbit] = size(chrom); fit = []; [fit, sumfit] = fitness(objf, chrom, a, b); % 적합도를 계산
for k = 1:nr, cumfit(k) = sum(fit(1:k)); end % 누적 적합도
pname = [];
for i = 1:nr % 적합도에 따른 선택
    rval = floor(sumfit*rand); % 랜덤 적합도 값으로 시작
    if rval < cumfit(1), pname = [pname 1];
    else
        for j = 1:nr-1
            sl = cumfit(j); su = cumfit(j+1);
            if (rval >= sl) && (rval <= su), pname = [pname j+1]; end
        end
    end
end

newchrom(1:nr,:) = chrom(pname,:);
end