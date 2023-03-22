%%%%%%%%%%%%%  Function median3x3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 5x5 median (neighborhood average) filter at each pixel 
%           in an image 
%
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>

function [median] = median5x5(f)

%  Fill the output image with zeroes first
%  (Step below is admittedly very cumbersome!)

median = zeros('like',f);
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
        temp_num = zeros(5,5);
        for i = -2 : 2
            for j = -2 : 2   
                temp_num(i,j) = g(x-i,y-j);
            end
        end
        temp_num = reshape(temp_num, [1 25]);
        temp_num = sort(temp_num);
        median(x,y) = temp_num(13);
    end
end

% Convert back to an 8-bit image

median = uint8(median);
