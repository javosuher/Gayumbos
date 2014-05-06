function w = fbrfit(x, y, centros, sigma)
    phi = ones(length(x), length(centros) + 1);
    for i = 2 : length(centros) + 1
        phi(:, i) = normpdf(x, centros(i-1), sigma);
    end
    try
    w = pinv(phi) * y';
    catch err
        w = zeros(length(centros)+1,1);
    end
end
