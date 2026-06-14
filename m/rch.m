function v = rch(chrow,a,b)
% chrow(개체군의 행)를 실수로 전환
n = length(chrow); maxchrom = 2^n - 1; rnum = chrow.*((2*ones(1,n)).^fliplr([0:n-1]));
v = a + (b-a)*sum(rnum)/maxchrom; % 십진수 값을 계산
end