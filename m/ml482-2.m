% chiplot.m
chi2 = linspace(0, 20, 200); lm = {'-','--',':','.', '-.'};
f = @(nu) exp(-chi2/2).*chi2.^(nu/2-1)./(2.^(nu/2).*gamma(nu/2));
for i = 1:5
    nu = 2*i; y = f(nu); plot(chi2,y,lm{i}); hold on
end
hold off, axis([0 20 0 0.25]), xlabel('X^2'), ylabel('p(X^2)')
legend('n=2','n=4','n=6','n=8','n=10','location','best')
