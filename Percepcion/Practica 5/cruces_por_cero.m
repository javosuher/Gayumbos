function salida = cruces_por_cero(senal,num_muestras,despl,ventana)
    seg=segmentacion(senal,num_muestras,despl);
    salida = sum(enventanado(abs(sign([seg(:, 1) seg(:,2:end)])-sign([seg(:, 1).*0 seg(:,1:end-1)])) ./ 2,ventana))/num_muestras;
end