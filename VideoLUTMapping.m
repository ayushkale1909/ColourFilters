cam = webcam('FHD Camera'); 
figure;

lut = linspace(0, 1, 256); 
for frameCount = 1:100 
    data = snapshot(cam);
    mappedImage = uint8(lut(double(data) + 1)); 
    subplot(1, 2, 1);
    imshow(data);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(mappedImage);
    title('Mapped Image');

    drawnow;
end

clear cam;
