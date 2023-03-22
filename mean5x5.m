%%%%%%%%%%%%%  Function mean5x5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5X5 mean (neighborhood average) filter at each pixel 
%           in an image 
%
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>

function [mean_output] = mean5x5(f)

%  Fill the output image with zeroes first
mean_output = zeros('like',f);
M = size(f,1);
N = size(f,2);

% Convert f to a 16-bit number, so we can do  sums > 255 correctly

g = uint16(f);

% Define the coordinate limits for output pixels that can be properly
%     computed by the 3X3 filter

xlo = 3;   % Can't process first column
xhi = M-2; % Can't process last  column
ylo = 3;   % Can't process first row
yhi = N-2; % Can't process last  row

% Compute the filtered output image

for x = xlo : xhi        % Don't consider boundary pixels that can't
    for y = ylo : yhi    %    be processed! 
        for i = -2 : 2
            for j = -2 : 2   
                mean_output(x,y) = g(x-i,y-j) + mean_output(x,y);
            end
        end
        mean_output(x,y) = mean_output(x,y) / 25.;
    end
end

% Convert back to an 8-bit image

mean_output = uint8(mean_output);
