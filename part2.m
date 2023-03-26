img = imread('Images/cwheelnoise.gif');

% Part a
wheelplot(img, 0, 'init');
for e = 1:100
    img = anisoDiff(img, 50, 'exp');
    if (e == 5 || e == 20 || e == 100)
        wheelplot(img, e, 'exp');
    end
end

for e = 1:100
    img = anisoDiff(img, 25, 'inv');
    if (e == 5 || e == 20 || e == 100)
        wheelplot(img, e, 'inv');
    end
end

%Part b
img = imread('Images/cameraman.tif');

imwrite(img, strcat("part2img/cameraman_img", num2str(0), ".png"))
for e = 1:100
    img = anisoDiff(img, 25, 'exp');
    if (e == 5 || e == 20 || e == 100)
        imwrite(img, strcat("part2img/cameraman_img_exp_", num2str(e), ".png"))
    end
end

for e = 1:100
    img = anisoDiff(img, 20, 'inv');
    if (e == 5 || e == 20 || e == 100)
        imwrite(img, strcat("part2img/cameraman_img_inv_", num2str(e), ".png"))
    end
end

function wheelplot(img, epoch, type)
% org img
imwrite(img, strcat("part2img/img_", type, num2str(epoch), ".png"))

% histogram
histogram(img);
saveas(gcf,strcat("part2img/hist_", type, num2str(epoch), ".png"))
close all

% line 128
line128 = img(:,128);
imwrite(line128, strcat("part2img/line128_", type, num2str(epoch), ".png"))

% spoke range
spokes = img(70:186,70:186);
imwrite(spokes, strcat("part2img/spokes_", type, num2str(epoch), ".png"))
end
