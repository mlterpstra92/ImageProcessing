function scaledImage = IPresizebl(image, x_f, y_f)
    scaledImage = zeros(round(y_f*size(image, 1)), round(x_f*size(image, 2)));
    for i=1:size(scaledImage, 2)
        for j=1:size(scaledImage, 1)
            x = max(1, min(i / x_f, size(image, 2)));
            y = max(1, min(j / y_f, size(image, 1)));
            
            neighbors = zeros(3, 4);
            neighbors(:,1) = [floor(y); floor(x); image(floor(y), floor(x))];
            neighbors(:,2) = [ceil(y); floor(x); image(ceil(y), floor(x))];
            neighbors(:,3) = [floor(y); ceil(x); image(floor(y), ceil(x))];
            neighbors(:,4) = [ceil(y); ceil(x); image(ceil(y), ceil(x))];
            
            alpha = y - neighbors(2, 1);
            beta = x - neighbors(1, 1);
            S = [(1-alpha)*(1-beta), alpha*(1 - beta), (1 - alpha) * beta, alpha*beta];
            scaledImage(j, i) = sum(S .* neighbors(3,:));
        end
    end
end