function dy = dyzeqn(t,y)
% y(1) = y, y(2) = z
a = -0.06; b = 210;
dy = [y(2); a*(b - y(1))];
end
