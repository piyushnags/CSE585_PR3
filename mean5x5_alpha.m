%%%%%%%%%%%%% Function mean3x3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:
% Compute a 3X3 mean (neighborhood average) filter at each pixel
% in an image
%
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>
function [out] = mean5x5_alpha(f, alpha)

out = zeros('like', f);
[M, N] = size(f);

% Convert f to a 16-bit number, so we can do sums > 255 correctly
g = uint16(f);

% Define the coordinate limits for output pixels that can be properly
% computed by the 3X3 filter

xlo = 3; % Can't process first two columns
xhi = M-2; % Can't process last two columns
ylo = 3; % Can't process first two rows
yhi = N-2; % Can't process last two columns

% trimming
trim = floor(alpha*25);

% Compute the filtered output image
for x = xlo : xhi % Don't consider boundary pixels that can't
    for y = ylo : yhi % be processed!
        tmp = f(x-2:x+2, y-2:y+2);
        tmp = sort(reshape(tmp, 25, 1));
        tmp = tmp(trim + 1: end - trim);
        out(x,y) = mean(tmp);
    end
end
% Convert back to an 8-bit image
out = uint8(out);