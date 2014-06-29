function col = color(image)
    % 1 - rojo, 2 - verde, 3 - azul
    
    imBW = im2bw(image);
    i = floor(size(imBW, 1) / 2);
    j = floor(size(imBW, 2) / 2);
    if imBW(i, j) == 0
        col = comparacion(image, i, j);
    else
        for i = 1 : size(imBW, 1)
            for j = 1 : size(imBW, 2)
                if imBW(i, j) == 0
                   col = comparacion(image, i, j); 
                end
            end
        end
    end
end

function col = comparacion(image, i, j)
    if image(i, j, 1) > image(i, j, 2) && image(i, j, 1) > image(i, j, 3)
        col = 1;
    else if image(i, j, 2) > image(i, j, 1) && image(i, j, 2) > image(i, j, 3)
        col = 2;
    else
        col = 3;
    end
    end
end