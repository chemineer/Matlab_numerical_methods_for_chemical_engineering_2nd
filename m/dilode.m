function dC = dilode(t,C)
dC = [-0.2*C(1); -0.4*(C(2) - C(1))];
end
