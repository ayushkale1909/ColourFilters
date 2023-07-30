cam = webcam('FHD Camera'); 
cam.Resolution = 'Full HD'; 
laplacianFilter = fspecial('laplacian');
sobelFilter = fspecial('sobel');
motionFilter = fspecial('motion', 50, 45);
figure;

while(true) 
    data = snapshot(cam);
    grayImage = rgb2gray(data);
    laplacianImage = imfilter(grayImage, laplacianFilter);
    sobelImage = imfilter(grayImage, sobelFilter);
    motionImage = imfilter(grayImage, motionFilter);
    edgeImage = edge(grayImage, 'Canny');
    subplot(3,2,1); imshow(grayImage); title('Grayscale Image');
    subplot(3,2,2); imshow(laplacianImage); title('Laplacian-Filtered Image');
    subplot(3,2,3); imshow(sobelImage); title('Sobel-Filtered Image');
    subplot(3,2,4); imshow(motionImage); title('Motion-Filtered Image');
    subplot(3,2,5); imshow(edgeImage); title('Edge Image');
    drawnow;
end

% Clear the webcam object
clear(cam);
