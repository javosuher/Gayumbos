function image = record()
    vid = videoinput('winvideo', 1);
    set(vid, 'ReturnedColorSpace', 'RGB');
    image = getsnapshot(vid);
end