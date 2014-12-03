function outImage = IPftfilter( image, D_0, filter_type, P, Q)
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
                filter(u, v) = IPgaussian_lowpass(P, Q, u, v, D_0);
            elseif strcmp(filter_type, 'GHPF')
                filter(u, v) = IPgaussian_highpass(P, Q, u, v, D_0);
            end
        end
    end
    % Multiply all pixels by the filter value.
    outImage = filter .* fftRepresentation;
    
    % Inverse shift, and transform back to spatial domain.
    outImage = ifft2(ifftshift(outImage));
    
    % Take only the real part, since that was what our original image was.
    outImage = real(outImage);
    
    % Reslice the image (if P and Q were higher than the image size)
    if P > size(image, 1)
        outImage = outImage(1:size(image, 1), :);
    end
    if Q > size(image, 2)
        outImage = outImage(:, 1:size(image, 2));
    end
end

