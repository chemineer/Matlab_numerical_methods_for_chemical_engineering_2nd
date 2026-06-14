
%coldelp.m: void fraction of packed bed
vis =1.1e-3; v0 = 0.1; d = 0.049; rho= 1.98e3; L =1.6; delP =416;
%data (in MKS units)
f = @(x) (150*vis*v0/d^2)*(1-x)^2/x^3 + (1.75*rho*v0^2/d)*(1-x)/x^3- delP/L;; %define eqn.
xa= 0; xb = 1; crit= 1e-6; maxi =1e3;
[x,fv,re,iter] = bisec(f,xa,xb,crit,maxi)
