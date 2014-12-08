function phi = haar_wavelet_V_2D(x, y, j, m, n)
%HAAR_SCALING_2D Returns the Haar scaling function on the domain x, y, with
%   parameters j, m and n.
    if nargin > 2
        if nargin < 4
            m = 0;
            n = 0;
        end
        % See Eq. 7.5-6
        phi = 2^(j / 2) * haar_wavelet_V_2D(2^j * x - m, 2^j * y - n);
        return;
    end
    % This is Eq. 7.5-3.
    phi = haar_scaling(x)' * haar_wavelet(y);
end