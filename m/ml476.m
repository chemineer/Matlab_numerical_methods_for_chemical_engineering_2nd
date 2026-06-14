% statis.m
tc = [5.394 5.564 5.654 5.465 5.495 5.404 5.524 5.414...
      5.514 5.335 5.614 5.455 5.534 5.524 5.475 5.295...
      5.384 5.614 5.554 5.675 5.455 5.554 5.504 5.584];

tcmean = mean(tc);
tcmedian = median(tc);
tcmode = mode(tc);
tcvar = var(tc);
tcstd = std(tc);

fprintf('평균 = %9.6f', tcmean);
fprintf('\n메디안 = %9.6f', tcmedian);
fprintf('\n모우드 = %9.6f', tcmode);
fprintf('\n분산 = %9.6f', tcvar);
fprintf('\n표준편차 = %9.6f\n', tcstd);
hist(tc) % 히스토그램
