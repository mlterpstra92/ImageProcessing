function finalImage = IPdwt2(image, J, finalImage)
    if nargin < 3
        % This only happens when the function is called by the user:
        % Initialize the final image as a matrix of zeroes.
        finalImage = zeros(size(image));
    end
    [M, N] = size(image);
    
    % Retrieve the horizontal 'averaging' component and the 'detail' 
    % component by taking the difference and average of the
    % original approximation.
    [ave, det] = decompose_2d(image, 'columns');
    
    % Decompose the components further to retrieve the lower scale
    % details and approximation.
    [Wa, Wh] = decompose_2d(ave, 'rows');
    [Wv, Wd] = decompose_2d(det, 'rows');
    
    % Set the detail parts of the final image correspondingly.
    finalImage(M/2+1:M, 1:N/2) = Wv;
    finalImage(1:M/2, N/2+1:N) = Wh;
    finalImage(M/2+1:M, N/2+1:N) = Wd;
    
    if J == 1
        % Set the lowest scale approximation to the upper-left corner.
        % The final image will be returned, since we're done now.
        finalImage(1:M/2, 1:N/2) = Wa;
    else
        % Go further in the recursion, now using the new approximation as
        % the input image.
        finalImage = IPdwt2(Wa, J - 1, finalImage);
    end
end