function image = IPdwt2scale(image, approxSize, fMax)
    if nargin < 3
        fMax = 255;
    end
    [N, ~] = size(image);
    
    % Rescale largest diagonal details (bottom-right)
    diagonalDetails = image(N/2 + 1:end, N/2 + 1:end);
    detailMax = max(max(abs(diagonalDetails)));
    % Scale to range [-0.5*fMax, 0.5*fMax]
    diagonalDetails = diagonalDetails .* ((fMax / 2) / detailMax);
    % Move to range [0, fMax]
    diagonalDetails = diagonalDetails + (fMax / 2);
    
    % Rescale largest horizontal details (top-right)
    horizontalDetails = image(1:N/2, N/2 + 1:end);
    detailMax = max(max(abs(horizontalDetails)));
    horizontalDetails = horizontalDetails .* ((fMax / 2) / detailMax);
    horizontalDetails = horizontalDetails + (fMax / 2);
    
    % Rescale largest vertical details (bottom-left)
    verticalDetails = image(N/2 + 1:end, 1:N/2);
    detailMax = max(max(abs(verticalDetails)));
    verticalDetails = verticalDetails .* ((fMax / 2) / detailMax);
    verticalDetails = verticalDetails + (fMax / 2);
    
    % Set rescaled details to image
    image(N/2 + 1:end, N/2 + 1:end) = diagonalDetails;
    image(1:N/2, N/2 + 1:end) = horizontalDetails;
    image(N/2 + 1:end, 1:N/2) = verticalDetails;
    
    if size(image, 1) / 2 == approxSize
        % We're done, since we're not rescaling the approximation, and all
        % the details are now already rescaled.
        return;
    else
        % Recursively rescale the rest of the image (top-left)
        image(1:N/2, 1:N/2) = IPdwt2scale(image(1:N/2, 1:N/2), approxSize, fMax);
    end
end

