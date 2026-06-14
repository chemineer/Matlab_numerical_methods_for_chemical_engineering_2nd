function dy = penode(t,y)
% y(1) = y1, y(2) = y2
dy = [y(2); -sin(y(1)) - 0.3*y(2)];
end
