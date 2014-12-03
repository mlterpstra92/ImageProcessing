function H = IPgaussian_lowpass(P, Q, u, v, D_0)
    % The distance from the origin
    dist = sqrt((u - P / 2)^2 + (v - Q / 2)^2);
    H = exp(-(dist^2) / (2 * D_0^2));
end