[x y] = ode45(@dyzeqn, xspan, [yi -25]); yf = y(end,1)
