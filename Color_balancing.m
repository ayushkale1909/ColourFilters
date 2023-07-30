cam = webcam('FHD Camera'); 

cam.Resolution = 'Full HD'; 

figure;
while(true) 
    data = snapshot(cam);
    redChannel = data(:, :, 1);
    greenChannel = data(:, :, 2);
    blueChannel = data(:, :, 3);
    meanRed = mean2(redChannel);
    meanGreen = mean2(greenChannel);
    meanBlue = mean2(blueChannel);

    balancedRed = redChannel * meanGreen / meanRed;
    balancedGreen = greenChannel;
    balancedBlue = blueChannel * meanGreen / meanBlue;

    balancedImage = cat(3, balancedRed, balancedGreen, balancedBlue);

    subplot(1, 2, 1); imshow(data); title('Original Image');
    subplot(1, 2, 2); imshow(balancedImage); title('Balanced Image');

    drawnow;
end

