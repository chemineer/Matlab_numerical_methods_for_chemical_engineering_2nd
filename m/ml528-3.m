Tv = min(T):0.1:max(T); Hv = polyval(p,Tv);
plot(Tv,Hv,T,H,'o'), xlabel('T(K)'), ylabel('H(kJ/kg)')
