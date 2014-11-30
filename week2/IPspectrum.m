function spectrum = IPspectrum( image, P, Q )
    if nargin < 2
        spectrum = abs(fftshift(fft2(image)));
    else
        spectrum = fftshift(fft2(image, P, Q));
    end
end

