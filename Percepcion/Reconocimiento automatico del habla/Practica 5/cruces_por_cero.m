function sali = cruces_por_cero(senal,num_muestras,despl,ventana)
    seg=segmentacion(senal,num_muestras,despl);
    env=enventanado(seg, ventana);
    salida = sum(enventanado(abs(sign([seg(:, 1) seg(:,2:end)])-sign([seg(:, 1).*0 seg(:,1:end-1)])) ./ 2,ventana))/num_muestras;
    %salida = [sign(seg(:,1)) sum(enventanado(abs(sign(seg(:,2:end))-sign(seg(:,1:end-1))) ./ 2,ventana))/num_muestras];
    sali=sum(abs([(sign(env(:,1:end-1))-sign(env(:,2:end))) sign(env(:,end))])./2)./num_muestras;
    figure, plot(salida);
    figure, plot(sali, 'r');
    pause
end
