close all
clear all
clc
% -----------------------------------------

senal = grabacion(2*8000, 8000, 2);
reproducir(senal);
%figure, plot(senal);
psenal = preenfasis(senal, 0.95);
%figure, plot(psenal);
segmentos = segmentacion(senal, 8000, 4000);