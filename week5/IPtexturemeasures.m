function [ output_args ] = IPtexturemeasures( image )
    h = zeros(1, 255);
    [M, N] = size(image);
    for i=1:M
        for j=1:N
            h(image(i, j)) = h(image(i, j)) + 1;
        end
    end
    indices = find(h > 0);
    L = size(indices, 2);
    values = h(indices);
    
    m = 0;
    for i=1:numel(h)
        m = m + i*h(i);
    end
    
    for zi = values
        
    end
end

