% mmlinreg.m
S = [1.2 1.6 3.2 4.3 5.8 7.6 8.8]; r = [0.06 0.12 0.24 0.27 0.33 0.34 0.34];
A1 = [(1./S)' ones(1,length(S))']; x1 = (A1'*A1)^-1*A1'*(1./r)'; a1 = 1/x1(2), b1 = a1*x1(1)
A2 = [(1./(S.^2))' ones(1,length(S))']; x2 = (A2'*A2)^-1*A2'*(1./r)';
a2 = 1/x2(2), b2 = sqrt(a2*x2(1))
Sv = min(S):0.01:max(S); r1 = a1*Sv./(b1+Sv); r2 = a2*Sv.^2./(b2^2 + Sv.^2);
plot(Sv,r1,':',Sv,r2,S,r,'o'), xlabel('[S]'), ylabel('r')
legend('1st-order','2nd-order','data','location','best')
