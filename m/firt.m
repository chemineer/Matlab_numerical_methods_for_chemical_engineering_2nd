function b = firt(g,p)
    % 지정된 크기응답을 갖는 FIR 필터 디자인
    % Inputs:
    %   g: 필터의 원하는 크기응답을 지정하는 함수, p: 필터 차수
    % Outputs:
    %   b: 필터계수 벡터((2p+1)x1)
    %   FIR 필터출력은 y(k) = b(1)u(k)+b(2)u(k-1)+...+b(2p+1)u(k-2p)
    b = zeros(2*p+1,1); c = zeros(p,1); n = 50; h = 1/n; b(p+1) = simpint(0,1,n,g);
    for k = 1:p
        c(k) = g(0) + cos(pi*k)*g(1);
        for i = 1:n-1
            if mod(i,2), c(k) = c(k) + 4*cos(pi*k*(i*h))*g(i*h);
            else, c(k) = c(k) + 2*cos(pi*k*(i*h))*g(i*h); end
        end
        c(k) = h*c(k)/3;
    end
    for k = 1:p % Add Hamming window
        b(p+1+k) = (0.54 + 0.46*cos(k*pi/p))*c(k); b(p+1-k) = b(p+1+k);
    end
end