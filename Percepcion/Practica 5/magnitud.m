function salida = magnitud(senal,num_muestras,despl,ventana)
    salida = sum(enventanado(abs(segmentacion(senal, num_muestras, despl)), ventana));
end