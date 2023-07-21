cam = webcam('FHD Camera');

figure;

while true
    frame = snapshot(cam);
    
    rgbImage = frame;
    ycbcrImage = rgb2ycbcr(frame);
    labImage = rgb2lab(frame);
    
    subplot(1,3,1);
    imshow(rgbImage);
    title('RGB');
    
    subplot(1,3,2);
    imshow(ycbcrImage);
    title('YCbCr');
    
    subplot(1,3,3);
    imshow(labImage);
    title('Lab');

    drawnow;
end
