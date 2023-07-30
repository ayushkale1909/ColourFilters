cam = webcam('FHD Camera');
figure;

for frameCount = 1:100 
    data = snapshot(cam);

    grayImage = rgb2gray(data);
    eqImage = histeq(grayImage);

    eqImage = repmat(eqImage, [1 1 3]);

    subplot(2, 3, 1);
    imshow(data);
    title('Original Image');

    subplot(2, 3, 2);
    imshow(eqImage);
    title('Equalized Image');

    subplot(2, 3, 3);
    imhist(grayImage);
    title('Histogram of Original Image');

    subplot(2, 3, 4);
    imhist(eqImage(:,:,1)); 
    title('Histogram of Equalized Image');

    subplot(2, 3, 5);
    cdfplot(double(grayImage(:)));
    title('CDF of Original Image');

    subplot(2, 3, 6);
    cdfplot(double(eqImage(:)));
    title('CDF of Equalized Image');

    drawnow;
end

clear cam;
