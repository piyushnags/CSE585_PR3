f = double(imread('Images/disk.gif'));

mean_result = mean5x5(f);
median_result = median5x5(f);
mean_alpha_result = mean5x5_alpha(f, 0.25);
sigma_result = sigma5x5(f, 20);
snnm_result = snnm5x5(f);

% org img
imwrite(mean_result, strcat("part1img/mean_", num2str(0), ".png"))
imwrite(median_result, strcat("part1img/median_", num2str(0), ".png"))
imwrite(mean_alpha_result, strcat("part1img/mean_alpha_", num2str(0), ".png"))
imwrite(sigma_result, strcat("part1img/sigma_", num2str(0), ".png"))
imwrite(snnm_result, strcat("part1img/snnm_", num2str(0), ".png"))

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

imwrite(mean_result, strcat("part1img/mean_", ...
    num2str(5), ".png"))
imwrite(median_result, strcat("part1img/median_", ...
    num2str(5), ".png"))
imwrite(mean_alpha_result, strcat("part1img/mean_alpha_", ...
    num2str(5), ".png"))
imwrite(sigma_result, strcat("part1img/sigma_", ...
    num2str(5), ".png"))
imwrite(snnm_result, strcat("part1img/snnm_", ...
    num2str(5), ".png"))
plot_stats(mean_result, 'mean', 5);
plot_stats(median_result, 'median', 5);
plot_stats(mean_alpha_result, 'mean_alpha', 5);
plot_stats(sigma_result, 'sigma', 5);
plot_stats(snnm_result, 'snnm', 5);

function plot_stats(img, fname, epoch)
    % histogram
    histogram(img);
    saveas(gcf,strcat("part1img/",fname,"_hist_", ...
        num2str(epoch), ".png"))
    close all
    
    % interior of large disk
    in = img(80:140,50:110);
    % Mean and variance
    fprintf("%s: Mean: %f, Stddev: %f", fname, mean(in, 'all'), ...
        std(reshape(double(in), 1, [])))
end