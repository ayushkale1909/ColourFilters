cam = webcam('FHD Camera'); 
cam.Resolution = '1920x1080'; 
cam.ExposureMode = 'auto'; 
cam.WhiteBalanceMode = 'auto'; 


figure;

for frameCount = 1:100 

    data = snapshot(cam);
    
    redChannel = data(:, :, 1);
    greenChannel = data(:, :, 2);
    blueChannel = data(:, :, 3);

    zeroMatrix = zeros(size(redChannel));

    redImage = cat(3, redChannel, zeroMatrix, zeroMatrix);
    redImage = imadjust(redImage, [0; 0.5], []); 

    greenImage = cat(3, zeroMatrix, greenChannel, zeroMatrix);
    greenImage = imadjust(greenImage, [0; 0.5], []);

    blueImage = cat(3, zeroMatrix, zeroMatrix, blueChannel);
    blueImage = imadjust(blueImage, [0; 0.5], []); 

    adjustedImage = imadjust(data, [0; 0.8], []); 

    subplot(4,5,1); imshow(data); title('Original Image');
    subplot(4,5,2); imshow(redImage); title('Red Filtered');
    subplot(4,5,3); imshow(greenImage); title('Green Filtered');
    subplot(4,5,4); imshow(blueImage); title('Blue Filtered');
    subplot(4,5,5); imshow(adjustedImage); title('Color Adjusted');
    
    subplot(4,5,6); imhist(redChannel); title('Red Channel Histogram');
    xlim([0 255]); 
    set(gca, 'YScale', 'log'); 
    subplot(4,5,7); imhist(redImage); title('Red Filtered Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    
    subplot(4,5,8); imhist(greenChannel); title('Green Channel Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    subplot(4,5,9); imhist(greenImage); title('Green Filtered Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    
    subplot(4,5,10); imhist(blueChannel); title('Blue Channel Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    subplot(4,5,11); imhist(blueImage); title('Blue Filtered Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    
    subplot(4,5,12); imhist(adjustedImage); title('Adjusted Image Histogram');
    xlim([0 255]);
    set(gca, 'YScale', 'log');
    
    subplot(4,5,2); title(sprintf('Red Filtered\nMean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(redImage), std2(redImage), entropy(redImage)));
    subplot(4,5,3); title(sprintf('Green Filtered\nMean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(greenImage), std2(greenImage), entropy(greenImage)));
    subplot(4,5,4); title(sprintf('Blue Filtered\nMean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(blueImage), std2(blueImage), entropy(blueImage)));
    subplot(4,5,5); title(sprintf('Color Adjusted\nMean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(adjustedImage), std2(adjustedImage), entropy(adjustedImage)));
    
    drawnow;
end

clear(cam);
