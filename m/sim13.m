function z = sim13(f,a0,b0,crit)
h = (b0 - a0)/2; c = zeros(1,3); c = f([a0 (a0+b0)/2 b0]);
s = h*(c(1) + 4*c(2) + c(3))/3; s2 = s; crit1 = crit; eh = crit;
z = [a0 b0 s s2 eh crit1];
end