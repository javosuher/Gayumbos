% Luis Jos� Quintana Bola�o y Javier Osuna Herrera

% Limpieza
clear all
close all
clc

% Cargamos los datos y los dividimos en las distintas clases
% correspondientes
x = load('wine_data.txt');
c1 = x(find(x(:, 1) == 1),2 : end);
c2 = x(find(x(:, 1) == 2),2 : end);
c3 = x(find(x(:, 1) == 3),2 : end);
y1 = zeros(length(c1), 3);
y2 = zeros(length(c2), 3);
y3 = zeros(length(c3), 3);
y1(:,1)=1;
y2(:,2)=2;
y3(:,3)=3;

n = 3; % 5 grupos
nr = 20; % Neuronas de la capa oculta
EG = zeros(nr, 1);
EGt = zeros(nr, 1);
for i = 1 : n
    % Se dividen en test y entrenamiento
    [x1t, x1v, y1t, y1v] = crossval(c1, y1, n, i);
    [x2t, x2v, y2t, y2v] = crossval(c2, y2, n, i);
    [x3t, x3v, y3t, y3v] = crossval(c3, y3, n, i);
    
    for j = 1 : nr
		net = newff(minmax([x1t;x2t;x3t]'), [j 3], {'tansig' 'logsig'}, 'trainlm');

		net.trainParam.showWindow = 0;
		net.trainParam.epochs = 100;
		net.trainParam.goal = 0.01;

		net = train(net,[x1t; x2t; x3t]', [y1t; y2t; y3t]'); 
		y = sim(net, [x1v; x2v; x3v]');
        
        [~, indv] = max(y);
        [~, ind] = max([y1v;y2v;y3v]');
        EG(j) = (length(find(indv ~= ind))^2) / length(indv);
    end
    EGt = EGt + EG;
end;

EGt = EGt / n;
figure, plot(EGt, 'b');
legend('Error de Generalizaci�n');

