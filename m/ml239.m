% useinterp1.m: 내장함수 interp1의 사용
tm = [0 18 42 55 70 82 86 95 102 115];
TC = [15 23 24 36 78 80 98 96 127 126];
tinv = linspace(0,115);

yn = interp1(tm, TC, tinv, 'nearest');
yl = interp1(tm, TC, tinv, 'linear');
ys = interp1(tm, TC, tinv, 'spline');
yp = interp1(tm, TC, tinv, 'pchip');

subplot(2,2,1), plot(tm,TC,'o',tinv,yn), axis([0 115 0 130]), title('nearest')
subplot(2,2,2), plot(tm,TC,'o',tinv,yl), axis([0 115 0 130]), title('linear')
subplot(2,2,3), plot(tm,TC,'o',tinv,ys), axis([0 115 0 130]), title('cubic spline')
subplot(2,2,4), plot(tm,TC,'o',tinv,yp), axis([0 115 0 130]), title('cubic Hermite')
