function scaledImage = IPresizebl(image, x_f, y_f)
    scaledImage = zeros(round(x_f*size(image, 2)), round(y_f*size(image, 1)));
    for i=1:size(scaledImage, 2)
        for j=1:size(scaledImage, 1)
            % Compute the x-coordinate in the original image
            x = max(1, min(i / x_f, size(image, 2)));
            y = max(1, min(j / y_f, size(image, 1)));
            
            % Make a matrix with on every row a neighbor.
            % First two elements of a row are coordinates.
            % Last element of a row is the value of that pixel.
            neighbors = zeros(4, 3);
            neighbors(1,:) = [floor(y), floor(x), image(floor(y), floor(x))];
            neighbors(2,:) = [ceil(y), floor(x), image(floor(y), ceil(x))];
            neighbors(3,:) = [floor(y), ceil(x), image(ceil(y), floor(x))];
            neighbors(4,:) = [ceil(y), ceil(x), image(ceil(y), ceil(x))];
            
            % Calculate the weighted average and insert it in scaledImage.
            alpha = x - neighbors(1, 2);
            beta = y - neighbors(1, 1);
            S = [(1-alpha)*(1-beta), alpha*(1-beta), (1-alpha)*beta, alpha*beta];
            scaledImage(yIdy, i) = sum(S .* neighbors(:,3)');
        end
    end
end