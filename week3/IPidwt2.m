function finalImage = IPidwt2(image, j)
    if j == 0
        % Just return the input image, since j=0.
        finalImage = image;
    else
        [M, N] = size(image);
        height = M / (2^j);
        width = N / (2^j);
        
        % Retrieve the current approximation, and the lowest level details
        % in all three directions.
        Wa = image(1:height           , 1:width);
        Wh = image(height + 1:2*height, 1:width);
        Wv = image(1:height           , width+1:2*width);
        Wd = image(height + 1:2*height, width+1:2*width);
        
        % Compose larger approximations in the vertical direction (more
        % rows).
        component1 = compose_2d(Wa, Wv, 'rows');
        component2 = compose_2d(Wh, Wd, 'rows');
        
        % Combine the two components and compose larger approximation in
        % the horizontal direction (more columns). Write the result in the
        % appropriate place in 'image'.
        image(1:height * 2, 1:width * 2) =  compose_2d(component1, component2, 'columns');
        
        % Pass the image with the higher level approximation to a deeper
        % recursion.
        finalImage = IPidwt2(image, j - 1);
    end
end

