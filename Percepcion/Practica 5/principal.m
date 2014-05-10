close all
clear all
clc
% -----------------------------------------

senal = grabacion(2*8000, 8000, 2);
reproducir(senal);
figure, plot(senal);
psenal = preenfasis(senal, 0.95);
figure, plot(psenal);
segmentos = segmentacion(psenal, 8000, 4000);
nMuestras = size(segmentos, 3);
for i = 1 : nMuestras
    figure, plot(segmentos(:, :, i));
end
segEnv = enventanado(segmentos, 'hamming');
for i = 1 : nMuestras
    figure, plot(segEnv(:, :, i));
end