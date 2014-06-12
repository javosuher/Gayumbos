clear all
close all
clc

datos = [1 2 ; 2.5 4.5 ; 2 2 ; 4 1.5 ; 4 2.5];
figure,
subplot(1,3,1),dendrogram(jerarquico(datos,'sigle'));title('Single Link')
subplot(1,3,2),dendrogram(jerarquico(datos,'complete'));title('Complete Link')
subplot(1,3,3),dendrogram(jerarquico(datos,'group'));title('Group Average Link')

load cities.mat
figure,
subplot(1,3,1),dendrogram(jerarquico(ratings,'sigle'));title('Single Link')
subplot(1,3,2),dendrogram(jerarquico(ratings,'complete'));title('Complete Link')
subplot(1,3,3),dendrogram(jerarquico(ratings,'group'));title('Group Average Link')