close all
clear all
clc
% -----------------------------------------

senal = grabacion(2*8000, 8000, 1);
reproducir(senal);
figure, plot(senal);
num_muestras = 240;
despl = 80;

psenal = preenfasis(senal, 0.95);
segmentos = segmentacion(psenal, num_muestras, despl);
segEnv = enventanado(segmentos, 'hamming');

senal_recortada = inicio_fin(segEnv, num_muestras, despl);
figure, plot(senal_recortada)

reproducir(senal_recortada);
