function psi = haar_wavelet(x, j, k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if nargin > 1
        if nargin < 3
            k = 0;
        end
        % See Eq. 7.2-10
        psi = 2^(j / 2) * haar_wavelet(2^j * x - k);
        return;
    end
    psi = (x >= 0 & x < 0.5) - (x >= 0.5 & x < 1);
end