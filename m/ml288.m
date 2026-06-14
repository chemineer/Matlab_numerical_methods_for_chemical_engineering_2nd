% usefilon.m: filon 함수 사용의 보기
n = 4; f = @(x) 1./x;
while n <= 4096
    fint = filon(f,2,1,1e-10,1,n); fprintf('%4.0f %17.8e\n',n,fint); n = 2*n;
end
