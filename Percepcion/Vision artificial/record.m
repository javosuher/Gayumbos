function image = record(show)
    vid = videoinput('winvideo', 1);
    set(vid, 'ReturnedColorSpace', 'RGB');
    image = getsnapshot(vid);
    if show == 1
        figure, imshow(image);
    end
end