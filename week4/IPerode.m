function eroded = IPerode(image, structuringElement )
    if nargin < 2
        structuringElement = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
    end
    % Initialise `eroded' as an image with only zeroes.
    eroded = zeros(size(image));
    
    % Zero-pad the input image.
    image = logical(padarray(image, [1, 1]));
    
    [M, N] = size(image);
    for i=2:M - 1
        for j=2:N - 1
            % Take the 3-by-3 neighbourhood where the SE is currently.
            neighbourhood = image(i-1:i+1, j-1:j+1);
            
            % Set pixel (j-1, i-1) to 1 only if all pixels of the
            % structuring element `fit inside' the pixels in the current
            % neighbourhood.
            eroded(i - 1, j - 1) = all(all(((neighbourhood & structuringElement) == structuringElement)));
        end
    end
end