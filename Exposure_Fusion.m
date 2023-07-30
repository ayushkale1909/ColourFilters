cam = webcam('FHD Camera');

figure;
subplot(2, 2, 1);
hImageInput = imshow(snapshot(cam));
title('Input Image');

subplot(2, 2, 2); 
hImageOutput = imshow(snapshot(cam));
title('Output Image');

frameCount = 0;
while ishandle(hImageInput)
    frameCount = frameCount + 1;

    frame = snapshot(cam);

    frame = im2double(frame);

    meanBrightness = mean(frame(:));

    hImageInput.CData = frame;
    subplot(2, 2, 1);
    title(sprintf('Input Mean Brightness: %.3f', meanBrightness));
    
    exposureLevels = 0.5:0.1:1.5; 
    exposedFrames = cell(size(exposureLevels));
    for i = 1:numel(exposureLevels)
        exposedFrames{i} = frame * exposureLevels(i);
        exposedFrames{i} = min(exposedFrames{i}, 1); 
    end
    
    fusedFrame = mean(cat(4, exposedFrames{:}), 4);
    
    meanBrightnessFused = mean(fusedFrame(:));
    
    hImageOutput.CData = fusedFrame;
    subplot(2, 2, 2);
    title(sprintf('Output Mean Brightness: %.3f', meanBrightnessFused));
end
