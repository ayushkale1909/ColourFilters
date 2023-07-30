cam = webcam('FHD Camera'); 
cam.Resolution = 'Full HD'; 
figure;

h = fspecial('gaussian', [3 3], 0.5);

while(true) 
    data = snapshot(cam);
    noisyImage = imnoise(data,'gaussian',0,0.01);
    gaussImage = imfilter(noisyImage, h);
    medImage = medfilt2(rgb2gray(noisyImage));

    subplot(3,3,1); imshow(noisyImage); title('Noisy Image');
    subplot(3,3,2); imshow(gaussImage); title('Gaussian-Filtered Image');
    subplot(3,3,3); imshow(medImage, []); title('Median-Filtered Image');
    
    subplot(3,3,4); imhist(rgb2gray(noisyImage)); title('Histogram of Noisy Image');
    subplot(3,3,5); imhist(rgb2gray(gaussImage)); title('Histogram of Gaussian-Filtered Image');
    subplot(3,3,6); imhist(medImage); title('Histogram of Median-Filtered Image');
    
    subplot(3,3,7); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(noisyImage)), std2(rgb2gray(noisyImage))));
    subplot(3,3,8); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(gaussImage)), std2(rgb2gray(gaussImage))));
    subplot(3,3,9); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(medImage), std2(medImage)));
    
    drawnow;
end

% Clear the webcam object
clear(cam);
