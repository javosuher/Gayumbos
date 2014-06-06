clear all;
close all;
clc

% Cargamos diferentes conjuntos de datos
datos1 = randn(1000, 2);
datos2 = [randn(100, 2) * 30 + 100; 
         randn(100, 2) * 20 + 300; 
         randn(100, 2) * 10 + 500; 
         randn(100, 2) * 30 + 700;
         randn(100, 2) * 50 + 900];
load cities.mat
cityData = [ratings(:, 3) ratings(:, 6)]; % Salud y educación

% -----------------------------------> k medias 

% Primer ejemplo k medias
figure
for k = 4 : 7
    [centros, clases] = kmedias(datos1, k);
    subplot(2, 2, k - 3)
    plotpat(datos1', clases, '.'); hold on;
    plotpat(centros', 'dm'); hold off;
end

% Segundo ejemlo
figure
for k = 4 : 7
    [centros, clases] = kmedias(datos2, k);
    subplot(2, 2, k - 3)
    plotpat(datos2', clases, '.'); hold on;
    plotpat(centros', 'dm'); hold off;
end

% Tercer ejemplo con la base de datos cities
figure
for k = 4 : 7
    [centros, clases] = kmedias(cityData, k);
    subplot(2, 2, k - 3)
    plotpat(cityData', clases, '.'); hold on;
    plotpat(centros', 'dm'); hold off;
end

% -----------------------------------> adaptativo

theta = 0.8;

% Primer ejemplo adaptativo
figure
j = 1;
for p = 2 : 0.5 : 3.5
    [centros, clases] = adaptativo(datos1, p, theta);
    subplot(2, 2, j)
    plotpat(datos1', clases, '.'); hold on;
    plotpat(centros', 'dm'); 
    for i = 1 : size(centros, 1)
        circulo(centros(i, 1), centros(i, 2), p);
        circulo(centros(i, 1), centros(i, 2), p * theta);
    end
    hold off;
    j = j + 1;
end

% Segundo ejemlo
figure
j = 1;
for p = 200 : 50 : 350
    [centros, clases] = adaptativo(datos2, p, theta);
    subplot(2, 2, j)
    plotpat(datos2', clases, '.'); hold on;
    plotpat(centros', 'dm'); 
    for i = 1 : size(centros, 1)
        circulo(centros(i, 1), centros(i, 2), p);
        circulo(centros(i, 1), centros(i, 2), p * theta);
    end
    hold off;
    j = j + 1;
end

% Tercer ejemplo con la base de datos cities
figure
j = 1;
for p = 1000 : 500 : 2500
    [centros, clases] = adaptativo(cityData, p, theta);
    subplot(2, 2, j)
    plotpat(cityData', clases, '.'); hold on;
    plotpat(centros', 'dm'); 
    for i = 1 : size(centros, 1)
        circulo(centros(i, 1), centros(i, 2), p);
        circulo(centros(i, 1), centros(i, 2), p * theta);
    end
    hold off;
    j = j + 1;
end