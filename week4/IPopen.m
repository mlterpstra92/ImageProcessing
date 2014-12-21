function image = IPopen( image, structuringElement )
    if nargin < 2
        structuringElement = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
    end
    % First erode, then dilate.
    image = IPdilate(IPerode(image, structuringElement), structuringElement);

end

