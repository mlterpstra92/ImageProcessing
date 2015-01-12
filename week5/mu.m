function mu_n = mu(zs, hist, m, n)
    mu_n = dot((zs - m).^n, hist);
end