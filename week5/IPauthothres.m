function [image, threshold] = IPauthothres(image, deltaT)
    if nargin < 2
        deltaT = 0.1;
    end
    % Initial threshold guess.
    threshold = max(max(image)) / 2;
    previousThreshold = 0;
    
    % Continue when there is enough change in the threshold
    while abs(threshold - previousThreshold) > deltaT
        %Segment the image based on the threshold
        firstValues = image(image > threshold);
        secondValues = image(image <= threshold);
        
        %Calculate the averages of the segmentations
        firstMean = mean(firstValues);
        secondMean = mean(secondValues);
        
        %Continue iteration with new guess
        previousThreshold = threshold;
        threshold = (firstMean + secondMean) / 2;
    end
    
    %If the threshold is determined, actually segment the image
    image = (image > threshold);
end

