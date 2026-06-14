function yi = ratintp(x,y,xi)
% 유리함수 안점작 계산
% input:
% x: 독립변수 데이터, y: 종속변수 데이터
% xi: 안점작 함수값을 계산할 독립변수 값
% output:
% yi: xi에서의 안점작 함수값
[mx nx] = size(x); [mix nix] = size(xi); test = 0;
for h = 1:nix
    for i = 1:nx
        dfx = (xi(h) - x(i));
        if dfx == 0, yi(h) = y(i); test = 1; end
    end
    if test == 0
        R = zeros(nx); R(:,1) = y(:);
        for i = 1:nx-1
            D = R(i+1,1) - R(i,1); rf = (xi(h) - x(i))/(xi(h) - x(i+1));
            den = rf*(1 - D/R(i+1,1)) - 1; R(i,2) = R(i+1,1) + D/den;
        end
        for j = 3:nx
            for i = 1:nx-j+1
                D = R(i+1,j-1) - R(i,j-1); rf = (xi(h) - x(i))/(xi(h) - x(i+j-1));
                if D == 0, R(i,j) = R(i+1,j-1);
                else
                    dif = R(i+1,j-1) - R(i+1,j-2); den = rf*(dif-D) - dif;
                    R(i,j) = R(i+1,j-1) + D*dif/den;
                end
            end
        end
        yi(h) = R(1,nx);
    end
    test = 0;
end
end