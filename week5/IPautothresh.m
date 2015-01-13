function [image, threshold] = IPautothresh(image, deltaT)
    if nargin < 2
        deltaT = 0.1;
    end
    % Use the mean as initial threshold estimate
    threshold = mean(image(:));
    previousThreshold = Inf;
    
    % Continue while there is still too much change in the threshold
    while abs(threshold - previousThreshold) > deltaT
        % Segment the image based on the current threshold
        G_1 = image(image > threshold);
        G_2 = image(image <= threshold);
        
        % Calculate the averages of the segmentations
        m_1 = mean(G_1);
        m_2 = mean(G_2);
        
        % Continue iteration with the more accurate threshold
        previousThreshold = threshold;
        threshold = (m_1 + m_2) / 2;
    end
    
    % When the threshold is determined, return the segmented image using
    % this threshold.
    image = (image > threshold);
end

