close all
clear all
clc
% -----------------------------------------

senal = grabacion(2*8000, 8000, 1);
reproducir(senal);
figure, plot(senal);
salida = energia(senal, 8000, 4000, 'hamming');
figure, plot(salida);
% psenal = preenfasis(senal, 0.95);
% figure, plot(psenal);
% segmentos = segmentacion(psenal, 8000, 4000);
% % nMuestras = size(segmentos, 3);
% nMuestras = size(segmentos, 2);
% for i = 1 : nMuestras
%     % figure, plot(segmentos(:, :, i));
%     figure, plot(segmentos(:, i));
% end
% segEnv = enventanado(segmentos, 'hamming');
% for i = 1 : nMuestras
%     % figure, plot(segEnv(:, :, i));
%     figure, plot(segEnv(:, i));
% end