% uselobatto.m: lobatto 함수 사용의 보기
f = @(x) exp(5*x).*cos(2*x); a = 0; b = pi/2;
for n = [2 4 8 16 32 64], y = lobatto(f,a,b,n); fprintf('%3.0f%19.9f\n',n,real(y)); end
intf = -5*(exp(2.5*pi)+1)/29; fprintf('\n Exact %15.9f\n', intf);
