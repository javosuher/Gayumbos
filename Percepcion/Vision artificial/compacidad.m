function com = compacidad(image)
    imBW = im2bw(image);
    ele = strel('square', 3);
    imBW = imdilate(imBW, ele);
    ele = strel('disk', 5);
    imBW = imerode(imBW,ele);
    imF = imBW;
    imBW(find(imF == 0)) = 1;
    imBW(find(imF == 1)) = 0;
    figure, imshow(imBW)
    stats = regionprops(imBW, 'Area', 'Perimeter');
    area = [stats.Area];
    perimetro = [stats.Perimeter];
    com = perimetro .^ 2 ./ area;
    com = com(1);
end