function [x,z] = stfac(f,df,x0,delta,crit,maxiter)
% stfac.m: Steffensen의 가속과정
% Input:
% f,df: 함수 및 함수의 미분, x0: 해의 초기 가정치
% delta: x0에 대한 한계기준, crit: 함수값에 대한 한계기준
% maxiter: 최대 반복과정 횟수
% Output:
% x: Steffensen 과정에 따른 근사해, z: Steffensen 수열을 포함하는 행렬
R = zeros(maxiter,3); R(1,1) = x0; % 행렬 R의 초기화
for k = 1:maxiter
    for j = 2:3
        den = feval(df,R(k,j-1));
        if den == 0, disp('Newton-Raphson 방법에서 0으로 나눔.'); return;
        else, R(k,j) = R(k,j-1) - feval(f,R(k,j-1))/den; end
    end
    aden = R(k,3) - 2*R(k,2) + R(k,1);
    if aden == 0, disp('Aitken 가속방법에서 0으로 나눔.'); break;
        else, R(k+1,1) = R(k,1) - (R(k,2) - R(k,1))^2 / aden;
    end

    %if (den == 0) | (aden == 0), break; end
    absR = abs(R(k,1) - R(k+1,1)); rerr = absR/(abs(R(k+1,1)) + delta);
    y = feval(f,R(k+1,1));

    if (absR < delta) | (rerr < delta) | (y < crit)
        x = R(k+1,1); z = R(1:k+1,:); break;
    end
end
end
