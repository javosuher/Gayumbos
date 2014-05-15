clear all
close all
clc

imagen = load('matricula_degradada.mat');
imagen = imagen.matricula;
figure, imshow(imagen,[0 255]);
% Simular el una imagen degradada por una c�mara enmovimiento
angulo = 45;  % en grados
for i = 40 : 50 % Probamos en un intervalo
    longitud = i; % en p�xeles
    % Proceso de distorcionamiento lineal
    PSF = fspecial('motion', longitud, angulo);
    im_restaurada = deconvwnr(imagen,PSF,0);
    imshow(uint8(im_restaurada),[]);
    disp(['Vamos por ' int2str(i)]);
    pause()
end

% la soluci�n es la longitud igual a 50 y el angulo es 45�!!