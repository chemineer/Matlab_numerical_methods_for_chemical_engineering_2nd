function dy = lzeqn(t, y, a, b, c)
% y(1) = x, y(2) = y, y(3) = z
dy = [a*(y(2) - y(1));
    b*y(1) - y(2) - y(1)*y(3);
    -c*y(3) + y(1)*y(2)];
end