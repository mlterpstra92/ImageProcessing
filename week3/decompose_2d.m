function [ave, det] = decompose_2d(image, along)

    % Retrieve the even and odd pixels of the image, along the requested
    % direction.
    if strcmp(along, 'columns') == 1
        newImageEven = image(:, 2:2:end);
        newImageOdd = image(:, 1:2:end);
    else
        newImageEven = image(2:2:end, :);
        newImageOdd = image(1:2:end, :);
    end
    
    % Retrieve the average values by taking the average of all odd/even
    % pairs.
    ave = (newImageEven + newImageOdd) / 2;
    
    % Retrieve the detailing information by taking the difference of all
    % odd/even pairs.
    det = (newImageEven - newImageOdd) / 2;
end