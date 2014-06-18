clear all
close all
clc

% % vid = videoinput('winvideo', 1);
% % set(vid, 'ReturnedColorSpace', 'RGB');
% % img = getsnapshot(vid);
% % imshow(img)
% % 
% % %imaqtool % Para erramientas de webcam
% 
% % Codigo clase
% 
% % Lee una imagen de un archivo (imread)
% % imagen = imread(nombre_fichero);
% % [imagen,paleta] = imread(nombre_fichero);
% imagen = imread('mandi.tif');
% % Muestra la imagen (imshow)
% figure, imshow(imagen);
% % Obtener el valor de un pixel de la imagen
% impixelinfo;
% % Guarda una imagen (imwrite)
% % imwrite(imagen, nombre_fichero [,parámetros_opcionales]);
% % imwrite(imagen,paleta, nombre_fichero 
% % [,parametros_opcionales]);
% imwrite(imagen,'mandi2.tif');

% 
% imagen = imread('laure.jpg');
% reduccion = [1 4 8 16 32 64];
% for i = 1:length(reduccion),
% figure,imshow(imresize(imresize(imagen,1/reduccion(i),'nearest'), reduccion(i),'nearest'));
% title([num2str(round(size(imagen,1)/reduccion(i))),'x',num2str(round(size(imagen,2)/reduccion(i)))]);
% pause;
% close;
% end

% 
% imagen = imread('cameraman.tif');
% niveles = [256 128 64 32 16 8 4 2];
% for i = 1:length(niveles),
% x = 256/niveles(i);  % número de valores diferentes
% figure,imshow((imagen / x), [0 niveles(i)-1]);
% title([num2str(niveles(i)),' niveles de gris']);
% pause;
% close;
% end


% 
% imagen = imread('cameraman.tif');
% imagen_binaria = imagen > 127;
% subplot(3, 2, 1);
% imshow(imagen);
% subplot(3, 2, 2);
% imshow(imagen_binaria);
% 
% imagen = uint8(imagen_binaria); 
% subplot(3, 2, 3);
% imshow(imagen); % Se pone todo negro
% 
% imagen = double(imagen_binaria);
% subplot(3, 2, 4);
% imshow(imagen);
% 
% 
% imagen_binaria = logical(imagen);
% subplot(3, 2, 5);
% imshow(imagen_binaria);



% 
% imagen = imread('cameraman.tif');
% subplot(1,3,1);
% imshow(imagen);
% subplot(1,3,2);
% douimag = double(imagen);
% imshow(douimag);
% subplot(1,3,3);
% dougimagbien = im2double(imagen);
% imshow(dougimagbien);


% 
% imagen = imread('kids.tif');
% imshow(imagen);
% pause;
% close;
% [imagen,mapa_colores] = imread('kids.tif');
% imshow(imagen,mapa_colores);


% 
% imagen = imread('wpeppers.jpg');
% subplot(2,3,2);
% imshow(imagen);
% subplot(2,3,4);
% imshow(imagen(:,:,1));
% subplot(2,3,5);
% imshow(imagen(:,:,2));
% subplot(2,3,6);
% imshow(imagen(:,:,3));


% 
% imagen = imread('cameraman.tif');
% subplot(3,4,2);
% imshow(imagen);
% xlabel('Original');
% for i=0:7,
% subplot(3,4,5+i);
% imshow(mod(floor(double(imagen)/2^i),2));
% xlabel(['Plano de bits ',num2str(i)]);
% end

% PDF 3


inc_brillo = 80;
imagen = imread('pout.tif');
subplot(2,2,1);
imshow(imagen);
subplot(2,2,3);
imhist(imagen), axis tight;
subplot(2,2,2);
imshow(imadd(imagen,inc_brillo));
subplot(2,2,4);
imhist(imagen + inc_brillo), axis tight; 