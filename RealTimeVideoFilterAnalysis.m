cam = webcam('FHD Camera');
cam.Resolution = 'Full HD';

figure;

h = fspecial('gaussian', [3 3], 0.5);

while(true)
    data = snapshot(cam);
    
    gaussImage = imfilter(data, h);
    
    medImage = medfilt2(rgb2gray(data));

    subplot(3,3,1); imshow(data); title('Original Image');
    subplot(3,3,2); imshow(gaussImage); title('Gaussian-Filtered Image');
    subplot(3,3,3); imshow(medImage, []); title('Median-Filtered Image');
    
    subplot(3,3,4); imhist(rgb2gray(data)); title('Histogram of Original Image');
    subplot(3,3,5); imhist(rgb2gray(gaussImage)); title('Histogram of Gaussian-Filtered Image');
    subplot(3,3,6); imhist(medImage); title('Histogram of Median-Filtered Image');
    
    subplot(3,3,7); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(data)), std2(rgb2gray(data))));
    subplot(3,3,8); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(rgb2gray(gaussImage)), std2(rgb2gray(gaussImage))));
    subplot(3,3,9); title(sprintf('Mean = %.2f\nStd = %.2f', mean2(medImage), std2(medImage)));
    
    drawnow;
end

clear(cam);
