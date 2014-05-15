close all;
clear all;
clc;

vid = videoinput('winvideo',1,'YUY2_320x240');
% funcion imaqtool para averiguar el formato de la cámara (YUY o RGB)
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'grayscale')
vid.FrameGrabInterval = 5;
start(vid);
while(vid.FramesAcquired <= 100),
    data = getsnapshot(vid);
    imshow(data)
end
stop(vid);
flushdata(vid);