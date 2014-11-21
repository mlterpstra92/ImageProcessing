function convoluted = IPfilter(image, mask)
    %IPFILTER Convolutes image with kernel mask
    [b, a] = (size(mask));
    b = floor(b / 2);
    a = floor(a / 2);
    [rows, cols] = size(image);
    % Pad image for convolution. Padding is half of the kernel size
    % at each side of the image, so in this case 2*b, 2*a
    padded = zeros(rows + 2 * b, cols + 2 * a);
    padded(1 + b:end - b, 1 + a:end - a) = image;
    % store here the convoluted image
    convoluted = zeros(size(padded));
    tic;
    % Perform convolution
    for x=1 + b:size(convoluted, 2) - b
        for y=1 + a:size(convoluted, 1) - a
            convoluted(y, x) = sum(sum(mask .* padded(y - a:y + a, x - b:x + b)));
        end
    end
    elapsedTime = toc;
    disp(['Total execution time: ', num2str(elapsedTime)]);
    disp(['Convolution time per pixel: ', num2str(elapsedTime / (rows * cols))]);
    % Remove padding
    convoluted = convoluted(1+b:end - b, 1 + a:end - a);
end

