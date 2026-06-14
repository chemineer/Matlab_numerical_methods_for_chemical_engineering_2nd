function [L00, L01, L10, L11] = hermpoly(x,a,b);
    % 구간의 양 끝점 x0 = a 와 x1 = b에서 f(x) 및 f'(x)와 일치하는 Hermite 다항식 값을 계산
    var0 = ((x-b)/(a-b))^2; var1 = ((x-a)/(b-a))^2; L01 = (x-a)*var0; L11 = (x-b)*var1;
    L00 = var0 - 2/(a-b)*(x-a)*var0; L10 = var1 - 2/(b-a)*(x-b)*var1;
end