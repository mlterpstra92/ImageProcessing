function H = IPgaussian_highpass(P, Q, u, v, d0)
    % The distance from the origin
    dist = sqrt((u - P / 2)^2 + (v - Q / 2)^2);
    H = 1 - exp(-(dist^2) / (2 * d0^2));
end