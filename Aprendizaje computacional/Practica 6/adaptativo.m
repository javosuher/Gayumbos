function [centros, clases] = adaptativo(datos, p, theta)
    % Cogemos de centro el primer dato
    centros(1, :) = datos(1, :);
    
    % Se inicializan el vector de clases
    clases = zeros(1, size(datos, 1));
    
    % Iteramos con todos los elentos que disponemos en los datos
    for i = 2 : size(datos, 1)
        distancias = pdist2(centros, datos(i, :), 'euclidean'); % Calculo distancia
        [distanciaM, clase] = min(distancias); % Sacamos el centro mas cercano
        if distanciaM > p
            centros = [centros; datos(i, :)]; % Si es mayor creamos nuevo centro
        end    
        if distanciaM < p * theta
            clases(i) = clase; % Si esta dentro p * theta lo incluimos en una clase
        end
        % Los que estén entre theta * p y p no pertenecen a ninguna clase
    end
end