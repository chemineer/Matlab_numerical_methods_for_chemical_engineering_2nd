function V = qreig(A,maxiter,tol)
% QR 분해에 의한 최대 고유치 계산
[n m] = size(A);
for k = 1:n-2
    x = A(:,k); x(1:k) = 0; p = sign(x(k+1)); if p == 0, p = 1; end
    g = norm(x); s = sqrt(2*g*(g + p*x(k+1)));
    if s ~= 0
        w = x/s; w(k+1) = (x(k+1) + p*g)/s; C = w*w'; d = (w'*A)*w;
        A = A - 2*C*A - 2*A*C + 4*d*C;
    end
end
for i = 1:maxiter
    Q = eye(n); R = A;
    for k = 1:n-1
        x1 = R(k,k); x2 = R(k+1,k); rr = sqrt(x1^2 + x2^2); c = x1/rr; 
		s = -x2/rr;
        Rn = R; Qn = Q;
        Rn(k,:) = c*R(k,:) - s*R(k+1,:); 
		Rn(k+1,:) = s*R(k,:) + c*R(k+1,:);
        Qn(:,k) = c*Q(:,k) - s*Q(:,k+1); 
		Qn(:,k+1) = s*Q(:,k) + c*Q(:,k+1);
        R = Rn; Q = Qn;
    end
    A = R*Q;
    for j = 1:n-1, t(j) = max(abs(A(j+1:n,j))); end
    mt(i) = max(t);


    if mt(i) < tol, disp('QR 방법은 수렴함.'); break; end
end
V = diag(A);
end