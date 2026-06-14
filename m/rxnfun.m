function f = rxnfun(x,c0,K1,K2)
% 반응식: c0(1)=ca0, c0(2)=cb0, c0(3)=cc0, c0(4)=cd0


    ca = c0(1) - 2*x(1)*c0(2) - x(2)*c0(4); cb = (1 - x(1))*c0(2);
    cc = c0(3) + x(1)*c0(2) + x(2)*c0(4); cd = (1 - x(2))*c0(4);
    f(1) = cc / ca^2 / cb - K1; f(2) = cc / ca / cd - K2;
    f = f'; % 열 벡터로 전환
end
