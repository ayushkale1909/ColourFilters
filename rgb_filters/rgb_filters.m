% Load 
image = imread('C:\Users\AyushKale\Desktop\ayush 3\Camera\image_file.jpg');

% Display the original image
figure;
imshow(image);
title('Original Image');

% Separate color channels
redChannel = image(:, :, 1);
greenChannel = image(:, :, 2);
blueChannel = image(:, :, 3);

zeroMatrix = zeros(size(redChannel));

redImage = cat(3, redChannel, zeroMatrix, zeroMatrix);

% Display the red-filtered image
figure;
imshow(redImage);
title('Red Filtered Image');

greenImage = cat(3, zeroMatrix, greenChannel, zeroMatrix);
figure;
imshow(greenImage);
title('Green Filtered Image');

blueImage = cat(3, zeroMatrix, zeroMatrix, blueChannel);
figure;
imshow(blueImage);
title('Blue Filtered Image');


% Histogram for each color channel
figure;
subplot(3,1,1);
imhist(redChannel);
title('Histogram of Red Channel');

subplot(3,1,2);
imhist(greenChannel);
title('Histogram of Green Channel');

subplot(3,1,3);
imhist(blueChannel);
title('Histogram of Blue Channel');

meanRed = mean2(redChannel);
stdRed = std2(redChannel);
entropyRed = entropy(redChannel);

fprintf('Red Channel: Mean = %f, Standard Deviation = %f, Entropy = %f\n', meanRed, stdRed, entropyRed);

meanGreen = mean2(greenChannel);
stdGreen = std2(greenChannel);
entropyGreen = entropy(greenChannel);

fprintf('Green Channel: Mean = %f, Standard Deviation = %f, Entropy = %f\n', meanGreen, stdGreen, entropyGreen);

meanBlue = mean2(blueChannel);
stdBlue = std2(blueChannel);
entropyBlue = entropy(blueChannel);

fprintf('Blue Channel: Mean = %f, Standard Deviation = %f, Entropy = %f\n', meanBlue, stdBlue, entropyBlue);
