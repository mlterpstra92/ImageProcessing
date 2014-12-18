function outImage = IPclassify(threshold)
    %Set values of ones to 256 for easier division later on
    image = readLogicalImage('nutsbolts') * 256;
    while any(any(image == 256))
        % Find indices in the image with value 256
        [row, col] = find(image == 256);
        
        % Pick a random element
        % TODO: is this a morphological or set operation?
        randomIdx = randi(size(row, 1));
        randomRow = row(randomIdx);
        randomCol = col(randomIdx);
        
        % Set the mask
        mask = zeros(size(image));
        mask(randomRow, randomCol) = 256;
        
        % TODO: implement IPrecon_by_dilation
        % It is either 128 or 64 as result, so divide by 2
        reconstructed = IPrecon_by_dilation(image, mask, [1,1,1;1,1,1;1,1,1]) / 2;
        
        % If the number of pixels is smaller than threshold (so bolt)
        % divide by 2 again
        if size((any(reconstructed) >= 1), 1) < threshold
            reconstructed = reconstructed / 2;
        end
        
        %Set the appropriate elements to their correct value
        %TODO: can this be done without for loops? 
        %example input:
        %image = [256, 0, 0; 0, 0, 256];
        %recon = [64, 0, 0; 0, 0, 0];
        %desired output: [64, 0, 0; 0, 0, 256];
        [M, N] = size(reconstructed);
        for i=1:M
            for j=1:N
                if reconstructed(i, j) ~= 0
                    image(i, j) = reconstructed(i, j);
                end
            end
        end
    end
    outImage = image;
end

