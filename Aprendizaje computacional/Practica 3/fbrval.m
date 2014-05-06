%Luis José Quintana Bolaño y Javier Osuna Herrera

function h = fbrval(x, w, centros, sigma)
    phi = ones(length(x), length(centros) + 1);
    for i = 2 : length(centros) + 1
        phi(:, i) = normpdf(x, centros(i-1), sigma);
    end
    h = phi * w;
end