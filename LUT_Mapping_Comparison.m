cam = webcam('FHD Camera'); 
data = snapshot(cam);

grayImage = rgb2gray(data);

lutPowerFunc = @(x) x.^0.5; 
lutContrastFunc = @(x) imadjust(x); 
lutColorFunc = @(x) cat(3, x(:, :, 2), x(:, :, 3), x(:, :, 1)); 
lutSigmoidFunc = @(x) 1 ./ (1 + exp(-(x - 128) / 32)); 

mappedPowerImage = uint8(lutPowerFunc(double(grayImage)) * 255); 
mappedContrastImage = lutContrastFunc(grayImage);
mappedColorImage = lutColorFunc(data);
mappedSigmoidImage = uint8(lutSigmoidFunc(double(grayImage)) * 255); 

figure;

subplot(2, 3, 1);
imshow(data);
title('Original Image');

subplot(2, 3, 2);
imshow(mappedPowerImage);
title('Mapped (Power Function)');

subplot(2, 3, 3);
imshow(mappedContrastImage);
title('Mapped (Contrast Enhancement)');

subplot(2, 3, 4);
imshow(mappedColorImage);
title('Mapped (Color Manipulation)');

subplot(2, 3, 5);
imshow(mappedSigmoidImage);
title('Mapped (Sigmoid Function)');

statistics = {'Mean', 'Standard Deviation', 'Entropy'};
labels = {'Original', 'PowerFunction', 'ContrastEnhancement', 'ColorManipulation', 'SigmoidFunction'};
values = zeros(3, 5);

values(:, 1) = [mean2(double(grayImage)); std2(double(grayImage)); entropy(grayImage)];

for i = 2:5
    mappedImage = eval(sprintf('mapped%sImage', labels{i}));
    if size(mappedImage, 3) > 1 
        mappedImage = rgb2gray(mappedImage);
    end
    values(:, i) = [mean2(double(mappedImage)); std2(double(mappedImage)); entropy(mappedImage)];
end

subplot(2, 3, 6);
uitable('Data', values, 'ColumnName', labels, 'RowName', statistics, 'Units', 'Normalized', 'Position', [0, 0, 1, 1]);

clear cam;
