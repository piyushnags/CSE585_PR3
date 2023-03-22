%%%%%%%%%%%%%  Function mean3x3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a 3X3 mean (neighborhood average) filter at each pixel 
%           in an image 
%
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>

function [mean] = mean3x3(f,fzero,M,N)

%  Fill the output image with zeroes first
%  (Step below is admittedly very cumbersome!)

for x = 1 : M        
    for y = 1 : N    
        mean(x,y) = fzero(x,y);
    end
end

% Convert f to a 16-bit number, so we can do  sums > 255 correctly

g = uint16(f);

% Define the coordinate limits for output pixels that can be properly
%     computed by the 3X3 filter

xlo = 2;   % Can't process first column
xhi = M-1; % Can't process last  column
ylo = 2;   % Can't process first row
yhi = N-1; % Can't process last  row

% Compute the filtered output image

for x = xlo : xhi        % Don't consider boundary pixels that can't
    for y = ylo : yhi    %    be processed! 
        for i = -1 : 1
            for j = -1 : 1   
                mean(x,y) = g(x-i,y-j) + mean(x,y);
            end
        end
        mean(x,y) = mean(x,y) / 9.;
    end
end

% Convert back to an 8-bit image

mean = uint8(mean);
