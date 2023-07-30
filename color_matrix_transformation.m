cam = webcam('FHD Camera'); 
data = snapshot(cam);

colorMatrix = [1.0, 0.2, 0.1; 0.4, 1.0, 0.3; 0.2, 0.3, 1.0]; 
transformedImage = applyColorMatrix(data, colorMatrix);

figure;
subplot(1, 2, 1);
imshow(data);
title('Original Image');

subplot(1, 2, 2);
imshow(transformedImage);
title('Transformed Image');

statistics = {'Mean', 'Standard Deviation', 'Entropy'};
labels = {'Original', 'Transformed'};
values = zeros(3, 2);

values(:, 1) = [mean2(rgb2gray(data)); std2(rgb2gray(data)); entropy(rgb2gray(data))];
values(:, 2) = [mean2(rgb2gray(transformedImage)); std2(rgb2gray(transformedImage)); entropy(rgb2gray(transformedImage))];

figure;
uitable('Data', values, 'ColumnName', labels, 'RowName', statistics, 'Units', 'Normalized', 'Position', [0, 0, 1, 1]);

clear cam;

function transformedImage = applyColorMatrix(image, colorMatrix)
    image = im2double(image);
    transformedImage = reshape(reshape(image, [], 3) * colorMatrix, size(image));
    transformedImage = max(0, min(1, transformedImage));
end
