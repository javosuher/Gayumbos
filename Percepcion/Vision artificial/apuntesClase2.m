% Imin = 75;
% Imax = 175;
% CMIN = 0;
% CMAX = 255;
% imagen = imread('pout.tif');
% subplot(2,3,1);
% imshow(imagen);
% xlabel('Original');
% subplot(2,3,4);
% imhist(imagen), axis tight;
% subplot(2,3,2);
% gamma = 0.5;
% imagen_exp=imadjust(imagen,[Imin/255,Imax/255],[CMIN/255,CMAX/255],gamma);
% imshow(imagen_exp);
% xlabel(['gamma = ',num2str(gamma)]);
% subplot(2,3,5);
% imhist(imagen_exp), axis tight;
% subplot(2,3,3);
% gamma = 1.5;
% imagen_exp=imadjust(imagen,[Imin/255,Imax/255],[CMIN/255,CMAX/255],gamma);
% imshow(imagen_exp);
% xlabel(['gamma = ',num2str(gamma)]);
% subplot(2,3,6);
% imhist(imagen_exp), axis tight;



% A=ones(50,50).*150;
% A(1:10,1:10)=75; 
% A(end-10:end,end-15:end)=25;
% subplot(2,3,2);
% imshow(A,[]);
% title(['imagen ',num2str(size(A,1)),'x',num2str(size(A,2))]);
% % Opciones del Filtro Convolución
% h=zeros(3,3) + 5./9;
% subplot(2,3,4);
% b=conv2(A,h,'full'); 
% imshow(b,[]);
% title(['full ',num2str(size(b,1)),'x',num2str(size(b,2))]);
% subplot(2,3,5);
% b=conv2(A,h,'same'); 
% imshow(b,[]);
% title(['same ',num2str(size(b,1)),'x',num2str(size(b,2))]);
% subplot(2,3,6);
% b=conv2(A,h,'valid');
% imshow(b,[]);
% title(['valid ',num2str(size(b,1)),'x',num2str(size(b,2))]);



% 
% subplot(2,3,2);
% A=imread('woodstatue.jpg');
% imshow(A,[]);
% title('Original');
% subplot(2,3,4);
% B=imnoise(A,'gaussian',0,0.01);
% imshow(B,[]);
% title('Gaussiano')
% subplot(2,3,5);
% B=imnoise(A,'salt & pepper',0.01);
% imshow(B,[]);
% title('Sal y Pimienta')
% subplot(2,3,6);
% B=imnoise(A,'speckle',0.01);
% imshow(B,[]);
% title('Multiplicativo');


% 
% A=imread('cell.tif');
% subplot(1,3,1);
% C=imnoise(A);
% imshow(C,[]);
% title ('imagen con ruido');
% subplot(1,3,2);
% h=fspecial('average'); % h = ones(3,3).*1/9;
% % I1=conv2(double(C), h,'full');
% I1 = imfilter(C,h);
% imshow(I1,[]);
% title('filtro media 3x3');
% subplot(1,3,3);
% h =fspecial('average',[7 7]); % h=ones(7,7).*1/49;
% % I1=conv2(double(C), h,'full');
% I1 = imfilter(C,h);
% imshow(I1,[]);
% title('filtro media 7x7');

% 
% A=imread('cell.tif');
% subplot(1,3,1);
% C=imnoise(A);
% imshow(C,[]);
% title ('imagen con ruido');
% subplot(1,3,2);
% h=fspecial('average'); 
% I1 = imfilter(C,h);
% imshow(I1,[]);
% title('filtro media 3x3');
% subplot(1,3,3);
% h =conv2([1 2 1],[1 2 1]')/16;
% I1 = imfilter(C,h);
% imshow(I1,[]);
% title('filtro binomial 3x3');

% 
% subplot(2,2,1);
% A = imread('cameraman.tif'); 
% imshow(A,[]);
% title('Original');
% subplot(2,2,2);
% B = imnoise(A);
% imshow(B,[]);
% title('Con ruido');
% subplot(2,2,3);
% h1=fspecial('gaussian');
% C = conv2(double(B),h1);
% imshow(C,[]);
% title('Filtro gaussiano');
% subplot(2,2,4);
% h2=fspecial('average');
% D = conv2(double(B),h2);
% imshow(D,[]);
% title('Filtro media');

% 
% A = imread('cameraman.tif');
% subplot(2,3,1);
% B = imnoise(A,'gaussian');
% imshow(B,[]);
% title('Con ruido gaussiano');
% subplot(2,3,4);
% C = imnoise(A,'salt & pepper',0.1);
% imshow(C,[]);
% title('Con ruido impulsional');
% h1=fspecial('average');
% subplot(2,3,2);
% D = conv2(double(B),h1);
% imshow(D,[]);
% title('Filtro media');
% subplot(2,3,5);
% D = conv2(double(C),h1);
% imshow(D,[]);
% title('Filtro media');
% subplot(2,3,3);
% D = nlfilter(B,[3 3],'median(x(:))'); %D=medfilt2(B);
% imshow(D,[]);
% title('Filtro mediana');
% subplot(2,3,6);
% D = nlfilter(C,[3 3],'median(x(:))'); %D=medfilt2(C);
% imshow(D,[]);
% title('Filtro mediana');


% 
% C=imread('cell.tif');
% subplot(1,3,1);
% imshow(C,[]);
% title ('imagen con ruido impulsional');
% subplot(1,3,2);
% I1 = ordfilt2(C,9,ones(3,3));
% imshow(I1,[]);
% title('filtro máximo 3x3');
% subplot(1,3,3);
% I1 = ordfilt2(C,1,ones(3,3));
% imshow(I1,[]);
% title('filtro mínimo 3x3');

% 
% subplot(2,2,1);
% A = imread('cameraman.tif'); 
% imshow(A,[]);
% title('Original');
% subplot(2,2,2);
% B = imnoise(A,'gaussian');
% imshow(B,[]);
% title('Con ruido gaussiano');
% subplot(2,2,3);
% h1=fspecial('gaussian',[5 5]);
% C = conv2(double(B),h1);
% imshow(C,[]);
% title('Filtro gaussiano');
% subplot(2,2,4);
% D = wiener2(double(B),[5 5]);
% imshow(D,[]);
% title('Filtro de Wiener');

% 
% ganancia = 2.2;
% A = imread('lena256.jpg');
% A = rgb2gray(A);
% h = fspecial('gaussian',[3 3],10);
% A = uint8(conv2(double(A),h));
% subplot(1,2,1);
% imshow(A,[]);
% title('Original');
% subplot(1,2,2);
% h = ones(3,3)*(-1);
% h(2,2) = 9 * ganancia - 1;
% h = 1/9 * h;
% B = uint8(conv2(double(A),h));
% imshow(B,[]);
% title('Realzada');

% 
% A = imread('lena256.jpg');
% A = rgb2gray(A);
% h = fspecial('gaussian',[3 3],10);
% A = uint8(conv2(double(A),h));
% subplot(1,2,1);
% imshow(A,[]);
% title('Original');
% subplot(1,2,2);
% h = fspecial('unsharp');
% B = uint8(conv2(double(A),h));
% imshow(B);
% title('Realzada');


imagen= imread('cameraman.tif');
im1=edge(imagen, 'prewitt'); 
im2=edge(imagen, 'sobel');
im3=edge(imagen, 'log');
im4=edge(imagen, 'canny');
subplot(2,2,1);
imshow(im1);title('Prewitt');
subplot(2,2,2);
imshow(im2);title('Sobel');
subplot(2,2,3);
imshow(im3);title('LoG');
subplot(2,2,4);
imshow(im4);title('Canny');