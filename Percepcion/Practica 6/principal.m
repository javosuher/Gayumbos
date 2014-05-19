close all
clear all
clc
% -----------------------------------------

%senall = grabacion(2*8000, 8000, 1);
load senal.mat
senall=senal;
reproducir(senal);
figure, plot(senal);
num_muestras = 240;
despl = 80;

psenal = preenfasis(senal, 0.95);
segmentos = segmentacion(psenal, num_muestras, despl);
segEnv = enventanado(segmentos, 'hamming');

[lz,lo] = inicio_fin(segEnv);%,despl);
inic=lz*despl;
fin=lo*despl;
%senal_recortada=senal(inic:fin);
%figure, plot(senal_recortada)
%reproducir(senal_recortada);
coef=delta(cepstrum(segEnv(:,lz:lo),11),4);
coef1=normaliza(coef);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
psenal = preenfasis(senall, 0.95);
segmentos = segmentacion(psenal, num_muestras, despl);
segEnv = enventanado(segmentos, 'hamming');

[lz,lo] = inicio_fin(segEnv);%,despl);
inic=lz*despl;
fin=lo*despl;
coef=delta(cepstrum(segEnv(:,lz:lo),11),4);
coef2=normaliza(coef);

DTW(coef1,coef2)


