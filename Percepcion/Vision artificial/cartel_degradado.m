clear all
close all
clc

imagen = imread('cartel_degradado.tif');
figure, imshow(imagen,[]);
% Simular el una imagen degradada por una cámara enmovimiento
angulo = 0;  % en grados
for i = 45 : 55 % Probamos en un intervalo
    longitud = i; % en píxeles
    % Proceso de distorcionamiento lineal
    PSF = fspecial('motion', longitud, angulo);
    im_restaurada = deconvwnr(imagen,PSF,0);
    imshow(uint8(im_restaurada),[]);
    disp(['Vamos por ' int2str(i)]);
    pause()
end

% la solución es la longitud igual a 51 y el angulo es 0º!!