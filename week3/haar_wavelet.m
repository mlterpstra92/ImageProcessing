function psi = haar_wavelet(x, j, k)
%HAAR_WAVELET Returns the Haar wavelet function on the domain x, with
%   parameters j and k.
    if nargin > 1
        if nargin < 3
            k = 0;
        end
        % See Eq. 7.2-10
        psi = 2^(j / 2) * haar_wavelet(2^j * x - k);
        return;
    end
    % Conversion to double since we want numeric values, not boolean
    psi = double((x >= 0 & x < 0.5)) - double((x >= 0.5 & x < 1));
end