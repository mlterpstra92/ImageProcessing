function approximation = IPidwt(dwt, J)
    if J == 0
        approximation = dwt;
    else
        n = length(dwt);
        
        % Retrieve the width of the current approximation. The details used
        % to enrich this approximation have, of course, the same length,
        % and are located next to the approximation.
        width = n/(2^J);
        a = dwt(1:width);
        d = dwt(n/(2^J) + 1: 2 * width);
        
        % Compute the new approximation by enriching the current
        % approximation with details.
        newApproximation = compose(a, d);
        
        % Set the new approximation to the place where previously the
        % coarser approximation and details were.
        dwt(1:2*width) = newApproximation;
        
        % Compute the more detailed approximations in the recursion.
        approximation = IPidwt(dwt, J - 1);
    end
end