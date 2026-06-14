function y = mhouse(u,A)
% 행렬 A에 Householder 행렬을 곱한다.
% y = (I - 2uu')A
y = A - 2*u*(u'*A);
end