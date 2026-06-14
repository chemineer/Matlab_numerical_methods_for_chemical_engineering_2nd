% bvp4cex.m
initsol = bvpinit(linspace(1,2,10), [1 0]); res = bvp4c(@bcprob,@bcval,initsol);
x = linspace(1,2); y = deval(res,x); plot(x,y(1,:)), grid, xlabel('x'),
ylabel('y')
function deset = bcprob(x,z)
deset = [z(2); 6*z(1)./x.^2];
end
function bcset = bcval(za,zb)
bcset = [za(1)-1; zb(1)-1];
end
