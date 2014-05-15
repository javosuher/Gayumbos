clear all
close all
clc

% 
% I =rgb2gray(imread('estacion.jpg'));
% imshow(I,[]);
% E = edge(I,'canny');
% figure,imshow(E);
% [H, theta, rho] =hough(E);
% peaks = houghpeaks(H,50);
% lines = houghlines(E, theta, rho, peaks);
% figure,imshow(I,[]);
% for k = 1:length(lines),
% xy = [lines(k).point1; lines(k).point2];
% line(xy(:,1),xy(:,2),'LineWidth',1.5,'Color','g');
% end


% 
% imgEnt = imread('coins.png');
% radioMoneda = 30;
% [y0,x0,Accumulator] = houghcircle(edge(imgEnt,'canny'),radioMoneda,4);
% UmbralVotaciones = 75; % corregido de transparencias
% [x,y] = find(Accumulator > UmbralVotaciones);
% imshow(imgEnt);
% hold on;
% for i = 1:size(x,1),
% [xc,yc] = circle(y(i),x(i),radioMoneda);
% plot(xc,yc);
% end
% hold off

% 
% vid = videoinput('winvideo', 1);
% set(vid, 'ReturnedColorSpace', 'RGB');
% imEnt = getsnapshot(vid);
% figure, imshow(imEnt)
% %imEnt = histeq(imEnt);
% imEnt = imfilter(imEnt,fspecial('gaussian'));
% imshow(imEnt,[]);
% umbral = graythresh(imEnt);
% imBW = im2bw(imEnt,umbral);
% figure, imshow(imBW);

% 
% imEnt = [7 7 1 1 1 1 1 1 2 2 2 2
% 2 2 1 2 2 1 1 1 2 2 2 2
% 1 3 3 3 4 2 2 2 2 2 2 2
% 1 2 3 4 5 2 2 2 2 2 3 2
% 2 2 2 2 2 2 2 2 2 2 2 2
% 1 1 1 1 1 1 1 1 1 1 1 1
% 1 1 1 1 1 1 1 2 2 2 2 2
% 1 3 4 4 4 4 5 6 7 3 4 1
% 1 2 3 3 3 3 3 3 3 3 3 3
% 4 4 2 3 4 5 6 8 8 8 8 8
% 1 2 3 4 4 4 8 8 8 8 8 8
% 1 2 3 4 5 6 8 8 8 8 8 8];
% [imG,num_reg,imSeed,imThreshold] = regiongrow(imEnt,7,2);

imEnt = imread('coins.png');
imEnt = imfilter(imEnt,fspecial('gaussian'));
[imG,num_reg,imSeed,imThreshold] = regiongrow(imEnt,180,90);
subplot(2,2,1);
imshow(imEnt,[]);
title('Imagen');
subplot(2,2,2);
imshow(imG,[]);
title('Img. segmentada');
subplot(2,2,3);
imshow(imSeed,[]);
title('Img. semillas');
subplot(2,2,4);
imshow(imThreshold,[]);
title('Img. umbral');