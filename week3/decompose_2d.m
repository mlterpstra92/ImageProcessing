function [ave, det] = decompose_2d(image, along)
    % Retrieve the even and odd pixels of the image, along the requested
    % direction.
    if strcmp(along, 'columns') == 1
        even = image(:, 2:2:end);
        odd = image(:, 1:2:end);
    else
        even = image(2:2:end, :);
        odd = image(1:2:end, :);
    end
    
    % Retrieve the average values by taking the average of all odd/even
    % pairs.
    ave = (even + odd) / 2;
    
    % Retrieve the detailing information by taking the difference of all
    % odd/even pairs.
    det = (even - odd) / 2;
end