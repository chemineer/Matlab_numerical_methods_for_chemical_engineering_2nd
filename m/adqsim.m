function [z, eh] = adqsim(f,a,b,crit)
% Input:
% f: 피적분 함수, a, b: 적분의 하한 및 상한, crit: 수렴기준
% Output:
% z: 적분의 근사값, eh: 추정오차
sm = zeros(30,6); iter = 0; strue = 1; sv = zeros(1,6);
sv = sim13(f,a,b,crit); sm(1,1:6) = sv; m = 1; st = iter;
while(st == iter)
    n = m;
    for j = n:-1:1
        p = j; sr0 = sm(p,:); eh = sr0(5); crit = sr0(6);
        if (crit <= eh)
            st = strue; sr1 = sr0; sr2 = sr0;
            a = sr0(1); b = sr0(2); c = (a + b)/2;
            eh = sr0(5); crit = sr0(6); crit2 = crit/2;
            sr1 = sim13(f,a,c,crit2); sr2 = sim13(f,c,b,crit2);
            eh = abs(sr0(3) - sr1(3) - sr2(3))/10;
            if (eh < crit)
                sm(p,:) = sr0; sm(p,4) = sr1(3) + sr2(3); sm(p,5) = eh;
            else
                sm(p+1:m+1,:) = sm(p:m,:); m = m+1;
                sm(p,:) = sr1; sm(p+1,:) = sr2; st = iter;
            end
        end
    end
end
z = sum(sm(:,4)); eh = sum(abs(sm(:,5))); sm = sm(1:m,1:6);
end