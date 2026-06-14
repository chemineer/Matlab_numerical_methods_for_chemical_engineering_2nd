function dy = fn(t,y)
n = length(t);
for k = 1:n
    if t(k) == 0, dy(k) = 1; else, dy(k) = y(k)*(-2*t(k) + 1/t(k)); end
end
end