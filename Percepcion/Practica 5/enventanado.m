function segmentos_enventanados = enventanado(segmentos, ventana)
    h = ventanal(ventana, length(segmentos));
    % nMuestras = size(segmentos, 3);
    nMuestras = size(segmentos, 2);
    % segmentos_enventanados = zeros(size(segmentos, 1), size(segmentos, 2), size(segmentos, 3));
    segmentos_enventanados = zeros(size(segmentos, 1), size(segmentos, 2));
    for i = 1 : nMuestras
        % segmentos_enventanados(:, 1, i) = segmentos(:, 1, i) .* h;
        % segmentos_enventanados(:, 2, i) = segmentos(:, 2, i) .* h;
        segmentos_enventanados(:, i) = segmentos(:, i) .* h;
    end
end