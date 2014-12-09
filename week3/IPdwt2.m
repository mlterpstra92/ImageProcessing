function finalImage = IPdwt2(image, j, finalImage)
    if nargin < 3
        % This only happens when the function is called by the user:
        % Initialize the final image as a matrix of zeroes.
        finalImage = zeros(size(image));
    end
    [M, N] = size(image);
    
    % Retrieve the 'averaging' component and the 'detail' component by
    % splitting the image up
    [ave, det] = decompose_2d(image, 'columns');
    [Wa, Wh] = decompose_2d(ave, 'rows');
    [Wv, Wd] = decompose_2d(det, 'rows');
    finalImage(M/2+1:M, 1:N/2) = Wv;
    finalImage(1:M/2, N/2+1:N) = Wh;
    finalImage(M/2+1:M, N/2+1:N) = Wd;
    if j == 1
        finalImage(1:M/2, 1:N/2) = Wa;
    else
        finalImage = IPdwt2(Wa, j - 1, finalImage);
    end
end