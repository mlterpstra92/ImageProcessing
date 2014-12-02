function h = IPgaussian(P, Q, u, v, d0, lowpass)
    if nargin < 6
        lowpass = true;
    end
    % The distance from the origin
    dist = sqrt((u - P / 2)^2 + (v - Q / 2)^2);
    h = exp(-(dist^2) / (2 * d0^2));
    if ~lowpass
        h = 1 - h;
    end
end

