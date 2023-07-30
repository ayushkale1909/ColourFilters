cam = webcam('FHD Camera'); 
data = snapshot(cam);

lutCorrectionFunc = @(x) x * [1.2 0.8 1.0]; 
correctedImage = lutCorrectionFunc(double(data)/255); 
correctedImage = im2uint8(correctedImage); 
figure;

subplot(1, 2, 1);
imshow(data);
title('Original Image');

subplot(1, 2, 2);
imshow(correctedImage);
title('Color Corrected Image');

clear cam;
