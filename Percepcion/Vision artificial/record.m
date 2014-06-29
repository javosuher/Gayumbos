function image = record()
    vid = videoinput('winvideo', 1);
    set(vid, 'ReturnedColorSpace', 'RGB');
    image = getsnapshot(vid);

    % Añadimos los ajustes
    load('parametros.mat')
    image = imadd(image, brillo);
end