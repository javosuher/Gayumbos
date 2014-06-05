function [centros, clases] = kmedias(datos, k)
    % Calculamos los centros
    aleat = randperm(size(datos, 1));
    centros = datos(aleat(1 : k), :);
    
    % Inicializamos las matrices de distancias
    distancias = zeros(length(centros), length(datos));
    distanciasA = ones(length(centros), length(datos));
    
    % Iteramos hasta que la distancia anterior no sea igual a la actual
    while sum(sum(distancias)) ~= sum(sum(distanciasA))
        distanciasA = distancias;
        distancias = pdist2(centros, datos, 'euclidean'); % Calculo de matriz de distancias
        [~, clases] = min(distancias); % Sacamos el centro mas cernano a todos los datos
        for i = 1 : k
            % Recalculamos la posición de los centros con la media
            centros(i, :) = mean(datos(find(clases == i), :));
        end
    end
    centros = centros';
end