function image = compose_2d(Wa, Wb, along)
    [M, N] = size(Wa);
    if strcmp(along, 'rows') == 1
        image = zeros(M*2, N);
        % Set the even rows to the sum, and the odd rows to the difference.
        image(2:2:end,:) = (Wa + Wb);
        image(1:2:end,:) = (Wa - Wb);
    else
        image = zeros(M, N*2);
        % Set the even columns to the sum, and the odd rows to the
        % difference.
        image(:,2:2:end) = (Wa + Wb);
        image(:,1:2:end) = (Wa - Wb);
    end
end