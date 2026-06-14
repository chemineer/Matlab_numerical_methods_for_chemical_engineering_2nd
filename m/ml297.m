% mcint.m
f = @(x) 2*x(2)/((1 + x(1))^2);
m = 2; maxn = 3; yt = 0.5; a = zeros(m,1); b = ones(m,1);
fprintf('\n n        I(D)        |e| \n');
fprintf('------------------------------\n');
for k = 0 : maxn
    n = 10^k; y = montcarint(a,b,n,f); rle = 100*(y - yt)/yt;
    fprintf ('%4i %11.7f %11.7f\n',n,y,rle);
end
