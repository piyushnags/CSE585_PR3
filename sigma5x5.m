function [out] = sigma5x5(f, sigma)

out = zeros(size(f), 'like', f);
[M, N] = size(f);

% Convert f to a 16-bit number, so we can do sums > 255 correctly
% g = uint16(f);
g = f;

% Define the coordinate limits for output pixels that can be properly
% computed by the 3X3 filter

xlo = 3; % Can't process first two columns
xhi = M-2; % Can't process last two columns
ylo = 3; % Can't process first two rows
yhi = N-2; % Can't process last two columns

% trimming


% Compute the filtered output image
for x = xlo : xhi % Don't consider boundary pixels that can't
    for y = ylo : yhi % be processed!
        tmp = f(x-2:x+2, y-2:y+2);
        tmp = sort(reshape(tmp, 25, 1));
        m_ = tmp(13);
        tmp_ = tmp( abs(tmp - m_) <= 2*sigma);
        out(x,y) = mean(tmp_);
        
    end
end
% Convert back to an 8-bit image
out = uint8(out);