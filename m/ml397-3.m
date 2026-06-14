[x y] = ode45(@dyzeqn, xspan, [yi -14.28]); yf = y(end,1)
