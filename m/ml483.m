% tdistplot.m
t = linspace(-3,3,600); lm = {'-','--','-.'};
f = @(x) (1./sqrt(x*pi)).*(gamma((x+1)/2)./gamma(x/2)).*(1+t.^2 /x).^(-(x+1)/2);
for i = 1:3
    nu = 4*(i-1)+1; y = f(nu); plot(t,y,lm{i}); hold on
end
hold off, axis([-3 3 0 0.4]), xlabel('t'), ylabel('p(t)'), line([0 0],[0 0.4])
legend('n=1','n=5','n=9','location','best')
