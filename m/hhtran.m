function R = hhtran(A)
[m n] = size(A);
for i = 1:m
    u = hhold(A(i:m,i)); A(i:m,i:n) = mhouse(u,A(i:m,i:n));
end
R = A;
end