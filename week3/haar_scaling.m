function phi = haar_scaling(x, j, k)
%HAAR_BASIS Returns the Haar scaling function on the domain x, with
%   parameters j and k.
    if nargin > 1
        if nargin < 3
            k = 0;
        end
        % See Eq. 7.2-10
        phi = 2^(j / 2) * haar_scaling(2^j * x - k);
        return;
    end
    % Conversion to double since we want numeric values, not boolean
    phi = double(x >= 0 & x < 1);
end