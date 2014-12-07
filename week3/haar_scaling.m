function phi = haar_scaling(x, j, k)
%HAAR_BASIS Summary of this function goes here
%   Detailed explanation goes here
    if nargin > 1
        if nargin < 3
            k = 0;
        end
        % See Eq. 7.2-10
        phi = 2^(j / 2) * haar_scaling(2^j * x - k);
        return;
    end
    phi = x >= 0 && x < 1;
end

