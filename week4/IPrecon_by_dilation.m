function prev = IPrecon_by_dilation(f, mask, se)

    % Perform the first step. (A do-while loop would have been more appropriate
    % here, but MATLAB lacks this.
    prev = f;
    current = and(IPdilate(prev, se), mask);

    % As long as there are still pixels that differ between the current and the
    % previous iteration, stay in the loop
    while any(any(current ~= prev))
        prev = current;
        current = and(IPdilate(prev, se), mask);
    end

    % When the loop has terminated, it means that the algorithm has stabilized,
    % so 'current' and 'prev' are both the morphological reconstruction by
    % dilation of the mask from f.
end