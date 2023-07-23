% Load
image = imread('C:\Users\AyushKale\Desktop\ayush 3\Camera\image_file.jpg'); 

% White balance adjustment 
adjustedImage = grayworld(image);


figure;
subplot(1, 2, 1);
imshow(image);
title('Original Image');
subplot(1, 2, 2);
imshow(adjustedImage);
title('White Balanced Image');

function adjustedImage = grayworld(image)
    image = im2double(image);

    avgR = mean(mean(image(:, :, 1)));
    avgG = mean(mean(image(:, :, 2)));
    avgB = mean(mean(image(:, :, 3)));

    scaleR = 0.5 / avgR;
    scaleG = 0.5 / avgG;
    scaleB = 0.5 / avgB;

    adjustedImage = image;
    adjustedImage(:, :, 1) = image(:, :, 1) * scaleR;
    adjustedImage(:, :, 2) = image(:, :, 2) * scaleG;
    adjustedImage(:, :, 3) = image(:, :, 3) * scaleB;
end
