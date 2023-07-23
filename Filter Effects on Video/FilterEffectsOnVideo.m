cam = webcam('FHD Camera'); 
figure;
h = fspecial('gaussian', [3 3], 0.5);

frameCount = 0;
while(frameCount<=100) 

    data = snapshot(cam);
    frameCount = frameCount + 1;
    
    noisyImage = imnoise(data,'gaussian',0,0.01);
    
    gaussImage = imfilter(noisyImage, h);
    
    redChannel = gaussImage(:, :, 1);
    greenChannel = gaussImage(:, :, 2);
    blueChannel = gaussImage(:, :, 3);
    
    medImage = medfilt2(rgb2gray(noisyImage));

    subplot(4,3,1); imshow(noisyImage); title('Noisy Image');
    subplot(4,3,2); imshow(gaussImage); title('Gaussian-Filtered Image');
    subplot(4,3,3); imshow(medImage, []); title('Median-Filtered Image');
    
    subplot(4,3,4); imshow(redChannel); title('Red Channel of Gaussian-Filtered Image');
    subplot(4,3,5); imshow(greenChannel); title('Green Channel of Gaussian-Filtered Image');
    subplot(4,3,6); imshow(blueChannel); title('Blue Channel of Gaussian-Filtered Image');
    
    subplot(4,3,7); imhist(rgb2gray(noisyImage)); title('Histogram of Noisy Image');
    subplot(4,3,8); imhist(rgb2gray(gaussImage)); title('Histogram of Gaussian-Filtered Image');
    subplot(4,3,9); imhist(medImage); title('Histogram of Median-Filtered Image');
    
    subplot(4,3,10); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(noisyImage)), std2(rgb2gray(noisyImage))));
    subplot(4,3,11); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(gaussImage)), std2(rgb2gray(gaussImage))));
    subplot(4,3,12); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(medImage), std2(medImage)));
    
    drawnow;
end

clear cam;
