cam = webcam('FHD Camera'); 
cam.Resolution = 'Full HD';
se = strel('disk',3); 

figure;

while(true) 
    data = snapshot(cam);
    
    grayImage = rgb2gray(data);

    erodedImage = imerode(grayImage, se);
    dilatedImage = imdilate(grayImage, se);
    openedImage = imopen(grayImage, se);
    closedImage = imclose(grayImage, se);
    
    subplot(3,2,1); imshow(grayImage); title('Grayscale Image');
    subplot(3,2,2); imshow(erodedImage); title('Eroded Image');
    subplot(3,2,3); imshow(dilatedImage); title('Dilated Image');
    subplot(3,2,4); imshow(openedImage); title('Opened Image');
    subplot(3,2,5); imshow(closedImage); title('Closed Image');
    
    subplot(3,2,6); imhist(grayImage); title('Histogram of Grayscale Image');
    subplot(3,2,7); imhist(erodedImage); title('Histogram of Eroded Image');
    subplot(3,2,8); imhist(dilatedImage); title('Histogram of Dilated Image');
    subplot(3,2,9); imhist(openedImage); title('Histogram of Opened Image');
    subplot(3,2,10); imhist(closedImage); title('Histogram of Closed Image');
    
    subplot(3,2,2); title(sprintf('Mean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(erodedImage), std2(erodedImage), entropy(erodedImage)));
    subplot(3,2,3); title(sprintf('Mean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(dilatedImage), std2(dilatedImage), entropy(dilatedImage)));
    subplot(3,2,4); title(sprintf('Mean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(openedImage), std2(openedImage), entropy(openedImage)));
    subplot(3,2,5); title(sprintf('Mean = %.2f\nStd = %.2f\nEntropy = %.2f', mean2(closedImage), std2(closedImage), entropy(closedImage)));
    drawnow;
end

clear(cam);
