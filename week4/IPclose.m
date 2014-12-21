function image = IPclose( image, structuringElement )
    if nargin < 2
        structuringElement = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
    end
    % First dilate, then erode.
    image = IPerode(IPdilate(image, structuringElement), structuringElement);
end