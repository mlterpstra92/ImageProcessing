function [image, threshold] = IPautothres(image, deltaT)
    if nargin < 2
        deltaT = 0.1;
    end
    % Initial threshold guess.
    threshold = (max(image(:)) - min(image(:))) / 2;
    previousThreshold = Inf;
    
    % Continue when there is enough change in the threshold
    while abs(threshold - previousThreshold) > deltaT
        %Segment the image based on the threshold
        G_1 = image(image > threshold);
        G_2 = image(image <= threshold);
        
        size(G_1)
        
        %Calculate the averages of the segmentations
        firstMean = mean(G_1);
        secondMean = mean(G_2);
        
        %Continue iteration with new guess
        previousThreshold = threshold;
        threshold = (firstMean + secondMean) / 2;
    end
    
    %If the threshold is determined, actually segment the image
    image = (image > threshold);
end

