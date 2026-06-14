xspan = [0 10]; yi = 300; [x y] = ode45(@dyzeqn, xspan, [yi -5]); yf = y(end,1)

