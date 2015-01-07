function outImage = IPclassify(threshold)
    %Threshold default to 1000
    %Don't use logical values
    image = single(readLogicalImage('nutsbolts'));
    while any(any(image == 1))
        % Find indices in the image with value 1
        [row, col] = find(image == 1);
        
        % Set the mask
        mask = zeros(size(image));
        mask(row(1), col(1)) = 1;
        
        % IPrecon_by_dilation returns a logical and we want definitely
        % something that is either 128 or 64, so multiply by 64
        reconstructed = IPrecon_by_dilation(mask, image, [1,1,1;1,1,1;1,1,1]) * 128;
        
        % If the number of pixels is smaller than threshold (so bolt)
        % divide by 2 again so result is 64 instead of 128
        if size(find(reconstructed == 128), 1) < threshold
            reconstructed = reconstructed / 2;
        end
        
        %Set the appropriate elements to their correct value
        %Find returns the index vector of nonzero elements
        s = find(reconstructed);
        image(s) = reconstructed(s);
    end
    outImage = image;
end

