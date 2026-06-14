% volcyl.m
a =182.23; b =0.06242; R = 0.08314; tol =1e-6; v0 = 1; % 상수 및 초기값
d=0.3; h = 1.4; Mw = 44.09; m = 3; T = 373.15; P =32; % 데이터
f= @(v) R*T/(v-b)-a/(v* (v+b)*sqrt(T))- P;

[v,iter] =secant(f,v0, tol)
V0= 0.25*pi*h*d^2; V = m*v/Mw; t = (V0 - V)/(pi*d*h + 0.5*pi*d^2)
