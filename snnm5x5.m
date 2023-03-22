%%%%%%%%%%%%%  Function snnm3x3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5x5 Symmetric Nearest-Neighbor Mean Filter (neighborhood average) filter at each pixel 
%           in an image 
%

function [snnm] = snnm5x5(f)

%  Fill the output image with zeroes first
%  (Step below is admittedly very cumbersome!)

snnm = zeros('like',f);
M = size(f,1);
N = size(f,2);

% Convert f to a 16-bit number, so we can do  sums > 255 correctly

g = uint16(f);

% Define the coordinate limits for output pixels that can be properly
%     computed by the 3X3 filter

xlo = 3;   % Can't process first 2 column
xhi = M-2; % Can't process last 2 column
ylo = 3;   % Can't process first 2 row
yhi = N-2; % Can't process last 2 row

% Compute the filtered output image

for x = xlo : xhi        % Don't consider boundary pixels that can't
    for y = ylo : yhi    %    be processed! 
        % Current window
        cur_window = g(x-2:x+2, y-2:y+2);
        upper_half = reshape(cur_window(:,1:3),1,[]);
        lower_half = reshape(cur_window(:,3:5),1,[]);
        % Only consider the first 12 items
        upper_half = upper_half(1:12);
        % Only consider the last 12 items
        lower_half = lower_half(end-11:end);
        x_center = g(x,y);
        % Find the min to x
        temp = zeros('like', upper_half);
        for i = 1: numel(upper_half)
            if abs(upper_half - x_center) < abs(lower_half - x_center)
                temp(i) = upper_half(i);
            else 
                temp(i) = lower_half(i);
            end
        end
        snnm(x,y) = (sum(temp) + x_center) / 13.;
    end
end

% Convert back to an 8-bit image

snnm = uint8(snnm);
