x = [0 0 0.2 0.5 0.6 0.5 1 1.1 1.2 1.2];
y = [0 1.5 2 0 1.5 2 0 1 1.5 2];
z = [0 0 0.3 0.6 0 0 0.6 0.8 1 0];
xi = 0:0.1:1;
yi = 0:0.1:2;
[XI,YI] = meshgrid(xi,yi);
ZI = griddata(x,y,z,XI,YI,'cubic');
mesh(XI,YI,ZI), hold on % 안점작된 표면을 그래프로 표현
plot3(x,y,z,'o'), xlabel('x'), ylabel('y'), zlabel('z'), hold off % 데이터 점들을 추가
