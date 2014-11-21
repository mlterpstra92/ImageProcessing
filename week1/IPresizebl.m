function scaledImage = IPresizebl(image, yFactor, xFactor)
    scaledImage = zeros(round(xFactor*size(image, 1)), round(yFactor*size(image, 2)));
    size(scaledImage)
    for xIdx=1:size(scaledImage, 1)
        for yIdx=1:size(scaledImage, 2)
            originalXIndex = max(1, min(xIdx / xFactor, size(image, 1)));
            originalYIndex = max(1, min(yIdx / yFactor, size(image, 2)));
            
            neighbors = zeros(4, 3);
            neighbors(1,:) = [floor(originalXIndex), floor(originalYIndex), image(floor(originalXIndex), floor(originalYIndex))];
            neighbors(2,:) = [ceil(originalXIndex), floor(originalYIndex), image(ceil(originalXIndex), floor(originalYIndex))];
            neighbors(3,:) = [floor(originalXIndex), ceil(originalYIndex), image(floor(originalXIndex), ceil(originalYIndex))];
            neighbors(4,:) = [ceil(originalXIndex), ceil(originalYIndex), image(ceil(originalXIndex), ceil(originalYIndex))];
            
            alpha = originalXIndex - neighbors(1, 1);
            beta = originalYIndex - neighbors(1, 2);
            S = [(1-alpha)*(1-beta), alpha*(1 - beta), (1 - alpha) * beta, alpha*beta];
            scaledImage(xIdx, yIdx) = sum(S .* neighbors(:,3)');
        end
    end
end