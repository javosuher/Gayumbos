function arbol = jerarquico(x, tipoDistancia)
    distPuntos = pdist2(x, x);
    distPuntos(find(eye(length(distPuntos)) == 1)) = inf;
    m = size(x, 1);
    distGrupos = ones(m + m - 1, m + m -1) * inf;
    distGrupos(1 : m, 1 : m) = distPuntos;
    for i = 1 : m - 1
        [vmin,inx]=min(distGrupos);
        [vmin,iny]=min(vmin); inx=inx(iny);
        arbol(i,:)=[inx iny vmin];
        for j = 1 : m-1+i
        	if j ~= inx && j ~= iny
        		distGrupos(j,m+i)=distancia(distGrupos, j, inx, iny, tipoDistancia);
                distGrupos(m+i,j)=distGrupos(j,m+i);
        	end
        end
        distGrupos(inx,:)=ones(1,m + m -1)*inf;
        distGrupos(iny,:)=ones(1,m + m -1)*inf;
        distGrupos(:,inx)= distGrupos(inx,:)';
        distGrupos(:,iny)= distGrupos(inx,:)';
	end     
end

function v=distancia(distGrupos, j, inx, iny, tipoDistancia)
    if strcmp(tipoDistancia, 'complete')
        v=max(distGrupos(j,[inx iny]));
    elseif strcmp(tipoDistancia, 'group')
        distancias=distGrupos(j,[inx iny]);
        v=mean(distancias);
    else
        v=min(distGrupos(j,[inx iny]));
    end
end
