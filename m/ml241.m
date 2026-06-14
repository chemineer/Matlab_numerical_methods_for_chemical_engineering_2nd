x = [0 0 0 0.5 0.5 0.5 1 1 1 1];
y = [0 1.5 2 0 1.5 2 0 1 1.5 2];
z = [0 0 0 0.6 0 0 0 0 1 0];
d = delaunay(x,y);
trimesh(d,x,y,z), xlabel('x'), ylabel('y'), zlabel('z')
