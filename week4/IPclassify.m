function outImage = IPclassify(threshold)
    %Threshold default to 1000
    %Set values of ones to 256 for easier division later on
    image = readLogicalImage('nutsbolts') * 256;
    while any(any(image == 256))
        % Find indices in the image with value 256
        [row, col] = find(image == 256);
        
        % Pick a first 256 element
        randomRow = row(1);
        randomCol = col(1);
        
        % Set the mask
        mask = zeros(size(image));
        mask(randomRow, randomCol) = 256;
        
        % IPrecon_by_dilation returns a logical and we want definitely
        % something that is either 128 or 64, so multiply by 64
        reconstructed = IPrecon_by_dilation(mask, image, [256,256,256;256,256,256;256,256,256]) * 128;

        % If the number of pixels is smaller than threshold (so bolt)
        % divide by 2 again so result is 64 instead of 128
        if size(find(reconstructed >= 1), 1) < threshold
            reconstructed = reconstructed / 2;
        end
        
        %Set the appropriate elements to their correct value
        %Find returns the index vector of nonzero elements
        s = find(reconstructed);
        image(s) = reconstructed(s);
    end
    outImage = image;
end

