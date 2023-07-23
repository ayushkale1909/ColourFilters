cam = webcam('FHD Camera'); 
cam.Resolution = '1920x1080'; 
figure;

while(true) 
    data = snapshot(cam);
    grayImage = rgb2gray(data);
    edgeImage = edge(grayImage, 'Canny');
    
    subplot(1,2,1); imshow(grayImage); title('Grayscale Image');
    subplot(1,2,2); imshow(edgeImage); title('Edge Image');
    
    drawnow;
end

