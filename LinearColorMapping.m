cam = webcam('FHD Camera'); 
figure;

colorMapFunc = @(x) 255 * (x - min(x(:))) / (max(x(:)) - min(x(:)));

frameCount = 0;
while(frameCount <= 100) 
    data = snapshot(cam);
    mappedImage = colorMapFunc(data);

    subplot(1, 2, 1); imshow(data); title('Original Image');
    subplot(1, 2, 2); imshow(mappedImage); title('Mapped Image');
    drawnow;

    frameCount = frameCount + 1;
end

clear cam;
