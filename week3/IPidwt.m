function approximation = IPidwt(dwt_rep, J)
    if J == 0
        % We're done. J is equal to 0, so no more steps have to be taken.
        approximation = dwt_rep;
    else
        n = length(dwt_rep);
        
        % Retrieve the width of the current approximation. The details used
        % to enrich this approximation have, of course, the same length,
        % and are located next to the approximation.
        width = n/(2^J);
        a = dwt_rep(1:width);
        d = dwt_rep(width + 1:2 * width);
        
        % Compute the new approximation by enriching the current
        % approximation with details.
        newApproximation = compose(a, d);
        
        % Set the new approximation to the place where previously the
        % coarser approximation and details were.
        dwt_rep(1:2*width) = newApproximation;
        
        % Compute the more detailed approximation(s) in the recursion.
        approximation = IPidwt(dwt_rep, J - 1);
    end
end