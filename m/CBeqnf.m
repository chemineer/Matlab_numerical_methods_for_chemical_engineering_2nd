function x = CBeqnf(f)
% f(x) = 0 형태로 정리한 Colebrook 방정식
Re = 8e4; % Reynolds 수
eD = 1.5e-4; % roughness
x = 1/sqrt(f) + 0.86*log(eD/3.7 + 2.51/Re/sqrt(f));
end
