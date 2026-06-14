T = [5:14]/10; P = [0.124 0.199 0.312 0.474 0.701 1.014 1.433 1.958 2.701 3.613];
m = 3;
c = lspolyfit(T,P,m)', Ti = T(1):0.01:T(end); Pi = polyval(c,Ti);
plot(Ti,Pi,T,P,'o'), grid
xlabel('T(deg.C)/100'), ylabel('P(bar)')
