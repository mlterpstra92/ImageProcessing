function convoluted = IPfilter(image, mask, timeIt)
    %IPFILTER Convolutes image with kernel mask
    if nargin < 3
        timeIt = false;
    end
    [a, b] = (size(mask));
    a = floor(a / 2);
    b = floor(b / 2);
    [rows, cols] = size(image);
    % Pad image for convolution. Padding is half of the kernel size
    % at each side of the image, so in this case 2*a, 2*b
    padded = zeros(rows + 2 * a, cols + 2 * b);
    padded(1 + a:end - a, 1 + b:end - b) = image;
    % store here the convoluted image
    convoluted = zeros(size(padded));
    tic;
    % Perform convolution
    for x=1 + a:size(convoluted, 1) - a
        for y=1 + b:size(convoluted, 2) - b
            convoluted(x, y) = sum(sum(mask .* padded(x - b:x + b, y - a:y + a)));
        end
    end
    elapsedTime = toc;
    if timeIt
        disp(['Total execution time: ', num2str(elapsedTime)]);
        disp(['Convolution time per pixel: ', num2str(elapsedTime / (rows * cols))]);
    end
    % Remove padding
    convoluted = convoluted(1+a:end - a, 1 + b:end - b);
end

