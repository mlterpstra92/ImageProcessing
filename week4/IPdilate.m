function dilated = IPdilate(image, structuringElement )
    if nargin < 2
        structuringElement = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
    end
    % Initialise `dilated' as a zero-padded copy of the input image.
    dilated = padarray(image, [1, 1]);
    
    [M, N] = size(image);
    for i=2:M+1
        for j=2:N+1
            % The origin of the SE is now at (i-1, j-1) in `image' and at
            % (i, j) in `dilated'.
            if image(i - 1 , j - 1);
                % The image pixel SE's origin is 1, so set all pixels where
                % the SE is 1 to 1 in the dilated image as well.
                dilated(i-1:i+1, j-1:j+1) = (dilated(i-1:i+1, j-1:j+1) | structuringElement);
            end
        end
    end
    
    % Slice the zero-padding off the output image.
    dilated = dilated(2:M + 1, 2:N + 1);
end