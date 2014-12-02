function outImage = IPftfilter( image, d0, lowpass, P, Q)
    if nargin < 4
        P = size(image, 1);
        Q = size(image, 2);
    end
    if nargin < 3
        lowpass = true;
    end
    fftRepresentation = IPspectrum(image);
    filter = zeros(P, Q);
    for u=1:P
        for v=1:Q
            filter(u, v) = IPgaussian(P, Q, u, v, d0, lowpass);
        end
    end
    outImage = abs(ifft2(ifftshift(filter .* fftRepresentation)));
end

