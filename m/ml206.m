% rxntemp.m: Gregory-Newton forward 안짐작을 이용한 최대 반응온도 계산
% 주어진 반응온도 데이터로부터 최대 반응온도와 이 온도에 도달하는 시간을 계산
rt = [1:12]; T = [66 68 69 70 72 76 84 91 92 82 69 70];
tvec = linspace(min(rt),max(rt)); % 안짐작을 위한 시간벡터
n = 2; % 안짐작 차수
tint = GregNew(rt,T,tvec,n); [maxtemp,k] = max(tint); maxt = tvec(k);
fprintf('\n시간 t = %5.2f에서 최대온도 %5.2f에 도달.\n', maxt, maxtemp);
plot(rt,T,'o',tvec,tint), grid, xlabel('t(hr)'), ylabel('온도(deg C)')
