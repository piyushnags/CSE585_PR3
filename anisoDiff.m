%%%%%%%%%%%%%  Function anisoDiff %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Purpose:  
%      Compute a Anisotropic Diffusion (neighborhood average) filter at each pixel 
%           in an image 
%
% <ORIGINAL LINES 6-31 CUT FOR THIS DEMO>

function [new_img] = anisoDiff(f, k, mode)

% predefine mode
if nargin < 3
    mode = 'exp';
end
lamb = 0.25;

%  Fill the output image with zeroes first
M = size(f,1);
N = size(f,2);

% Convert f to a 16-bit number, so we can do  sums > 255 correctly
cur_img = double(f);

% Selection of g(*) function
if strcmp(mode,'exp')
    g = @(x) exp(-(x/k).^2);
else
    g = @(x) 1 / (1 + (x/k).^2);
end
g(1)
% Define the coordinate limits for output pixels that can be properly
%     computed by the 3X3 filter

xlo = 2;   % Can't process first column
xhi = M-1; % Can't process last  column
ylo = 2;   % Can't process first row
yhi = N-1; % Can't process last  row

% Compute the filtered output image
new_img = zeros(size(cur_img),'like',cur_img);
for x = xlo : xhi        % Don't consider boundary pixels that can't
    for y = ylo : yhi    %    be processed!
        % Changes in NSEW
        del_N = cur_img(x,y+1) - cur_img(x,y);
        del_S = cur_img(x,y-1) - cur_img(x,y);
        del_E = cur_img(x+1,y) - cur_img(x,y);
        del_W = cur_img(x-1,y) - cur_img(x,y);
        % Coef
        c_N = g(del_N);
        c_S = g(del_S);
        c_E = g(del_E);
        c_W = g(del_W);
        % Changes for img
        new_img(x,y) = cur_img(x,y) + lamb * (c_N * del_N + ...
            c_S * del_S + c_E * del_E + c_W * del_W);
    end
end

% Convert back to an 8-bit image
new_img = uint8(new_img);
