function dy = stfode(t,y)
% y(1) = x, y(2) = y
dy = [9*y(1) + 24*y(2) - 5*cos(t) - (1/3)*sin(t); -24*y(1) - 51*y(2) - 9*cos(t) + (1/3)*sin(t)];
end
