% ferm02C02.m
% 페니실린 발효공정에서의 이산화탄소 발생률과 산소 소모량
% Simpson의 1/3 규칙을 이용
clear all; t = [130:136]; rCO2 = [15.72 15.53 15.19 16.56 16.21 17.39 17.36];
rO2 = [15.49 16.16 15.35 15.13 14.20 14.23 14.29];
m2CO2 = SimpsonDat(t,rCO2); m2O2 = SimpsonDat(t,rO2);
fprintf('총 CO2 발생량: %9.4f (Simpson 1/3 규칙을 이용)',m2CO2)
fprintf('\n총 산소 소모량: %9.4f (Simpson 1/3 규칙을 이용)\n',m2O2)
