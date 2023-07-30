cam = webcam('FHD Camera'); 
figure;

for frameCount = 1:100 
    data = snapshot(cam);
    
    data = im2double(data);
    
    avgR = mean(data(:, :, 1), 'all');
    avgG = mean(data(:, :, 2), 'all');
    avgB = mean(data(:, :, 3), 'all');
    
    avgGray = (avgR + avgG + avgB) / 3;
    
    scaleR = avgGray / avgR;
    scaleG = avgGray / avgG;
    scaleB = avgGray / avgB;
    
    balancedImage = data;
    balancedImage(:, :, 1) = data(:, :, 1) * scaleR;
    balancedImage(:, :, 2) = data(:, :, 2) * scaleG;
    balancedImage(:, :, 3) = data(:, :, 3) * scaleB;

    subplot(1, 2, 1);
    imshow(data);
    title('Original Image');

    subplot(1, 2, 2);
    imshow(balancedImage);
    title('White Balanced Image');

    drawnow;
end

clear cam;
