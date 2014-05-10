function segmentos_enventanados = enventanado(segmentos, ventana)
    if strcmp(ventana,'rectwin')
        h = rectwin(length(segmentos));
    end
    if strcmp(ventana,'hamming')
        h = hamming(length(segmentos));
    end
    if strcmp(ventana,'hanning')
        h = hanning(length(segmentos));
    end
    if strcmp(ventana,'barlett')
        h = barlett(length(segmentos));
    end
    if strcmp(ventana,'blackman')
        h = blackman(length(segmentos));
    end
    if strcmp(ventana,'boxcar')
        h = boxcar(length(segmentos));
    end
    if strcmp(ventana,'triang')
        h = triang(length(segmentos));
    end
    if strcmp(ventana,'gausswin')
        h = gausswin(length(segmentos));
    end
    if strcmp(ventana,'blackmanharris')
        h = blackmanharris(length(segmentos));
    end
    
    nMuestras = size(segmentos, 3);
    segmentos_enventanados = zeros(size(segmentos, 1), size(segmentos, 2), size(segmentos, 3));
    for i = 1 : nMuestras
        segmentos_enventanados(:, 1, i) = segmentos(:, 1, i) .* h;
        segmentos_enventanados(:, 2, i) = segmentos(:, 2, i) .* h;
    end
end