cam = webcam('FHD Camera'); 
data = snapshot(cam);

grayImage = rgb2gray(data);

eqImage = histeq(grayImage);

eqImage = repmat(eqImage, [1 1 3]);

figure;

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
imhist(eqImage);
title('Histogram of Equalized Image');

subplot(2, 3, 5);
cdfplot(grayImage(:));
title('CDF of Original Image');

subplot(2, 3, 6);
cdfplot(eqImage(:));
title('CDF of Equalized Image');

clear cam;
