clear all;
close all;
clc

datos = [randn(40, 2) * 10 + 300; 
         randn(40, 2) * 20 + 100; 
         randn(40, 2) * 10 + 200; 
         randn(40, 2) * 20 + 400];
n_centros = 4;

[centros, clases] = kmedias(datos, n_centros);
plotpat(datos', clases, '.'); hold on;
plotpat(centros, 'dm'); hold off;