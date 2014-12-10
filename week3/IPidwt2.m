function finalImage = IPidwt2(image, j)
    if j == 0
        % Just return the input image, since j=0.
        finalImage = image;
    else
        [M, N] = size(image);
        
        % Compute the height and width of the current approximation and
        % details.
        h = M / (2^j);
        w = N / (2^j);
        
        % Retrieve the current approximation, and the lowest level details
        % in all three directions.
        Wa = image(1:h           , 1:w);
        Wh = image(h + 1:2*h, 1:w);
        Wv = image(1:h           , w+1:2*w);
        Wd = image(h + 1:2*h, w+1:2*w);
        
        % Compose larger approximations in the vertical direction (more
        % rows).
        component1 = compose_2d(Wa, Wv, 'rows');
        component2 = compose_2d(Wh, Wd, 'rows');
        
        % Combine the two components and compose larger approximation in
        % the horizontal direction (more columns). Write the result in the
        % appropriate place in 'image'.
        image(1:h*2, 1:w*2) = compose_2d(component1, component2, 'columns');
        
        % Pass the image with the higher level approximation to a deeper
        % recursion.
        finalImage = IPidwt2(image, j - 1);
    end
end

