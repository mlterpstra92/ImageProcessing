function outImage = IPftfilter( image, D0, filter_type, P, Q)
    if nargin < 4
        P = size(image, 1);
        Q = size(image, 2);
    end
    if nargin < 3
        filter_type = 'GHPF';
    end
    fftRepresentation = IPspectrum(image, P, Q);
    filter = zeros(P, Q);
    for u=1:P
        for v=1:Q
            if strcmp(filter_type, 'GLPF')
                filter(u, v) = IPgaussian_lowpass(P, Q, u, v, D0);
            elseif strcmp(filter_type, 'GHPF')
                filter(u, v) = IPgaussian_highpass(P, Q, u, v, D0);
            end
        end
    end
    outImage = abs(ifft2(ifftshift(filter .* fftRepresentation)));
end

