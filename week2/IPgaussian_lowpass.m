function H = IPgaussian_lowpass(P, Q, u, v, D0)
    % The distance from the origin
    dist = sqrt((u - P / 2)^2 + (v - Q / 2)^2);
    H = exp(-(dist^2) / (2 * D0^2));
end