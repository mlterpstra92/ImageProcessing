function mu_z = mu(hist, n, m)
    mu_z = sum(((hist - m) .^ n) .* hist);
end

