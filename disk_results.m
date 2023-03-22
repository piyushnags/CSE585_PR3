function disk_results(f)

% ho is histogram of original image
ho = histogram(f);

% mean_result = mean5x5(f);
% median_result = median5x5(f);
% mean_alpha_result = mean5x5_alpha(f);
% sigma_result = sigma5x5(f);
% snnm_result = snnm5x5(f);
% 
% hmean = histogram(mean_result);
% hmedian = histogram(median_result);
% halpha = histogram(mean_alpha_result);
% hsigma = histogram(sigma_result);
% hsnnm = histogram(snnm_result);

for i = 1:5
    mean_result = mean5x5(f);
    median_result = median5x5(f);
    mean_alpha_result = mean5x5_alpha(f, 0.25);
    sigma_result = sigma5x5(f, 20);
    snnm_result = snnm5x5(f);

    hmean = histogram(mean_result);
    hmedian = histogram(median_result);
    halpha = histogram(mean_alpha_result);
    hsigma = histogram(sigma_result);
    hsnnm = histogram(snnm_result);
end
