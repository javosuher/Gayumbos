function salida = energia (senal, num_muestras, despl, ventana)
    salida = sum(enventanado(segmentacion(senal, num_muestras, despl), ventana).^2);
end