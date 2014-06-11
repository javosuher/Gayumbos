function arbol = jerarquico(x, tipoDistancia)
    distPuntos = pdist2(x, x);
    distPuntos(find(eye(length(distPuntos)) == 1)) = inf;
    m = size(x, 1);
    distGrupos = ones(m + m - 1, m + m -1) * inf;
    distGrupos(1 : m, 1 : m) = distPuntos;
    for i = 1 : m - 1
        
    end
end