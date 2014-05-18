clear all
close all
clc

imagen = imread('cartel_degradado.tif');
figure, imshow(imagen,[]); pause()
% Simular el una imagen degradada por una c�mara enmovimiento
subplot(1,2,1)
imshow(imagen,[])
angulo = 0;  % en grados
for i = 50 : 51 % Probamos en un intervalo
    longitud = i; % en p�xeles
    % Proceso de distorcionamiento lineal
    PSF = fspecial('motion', longitud, angulo);
    im_restaurada = deconvwnr(imagen,PSF,0);
    subplot(1,2,2)
    imshow(uint8(im_restaurada),[]);
    disp(['Vamos por ' int2str(i)]);
    pause()
end

% la soluci�n es la longitud igual a 51 y el angulo es 0�!!