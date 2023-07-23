cam = webcam('FHD Camera');

figure;
subplot(2, 2, 1); 
hImageInput = imshow(snapshot(cam));
title('Input Image');

subplot(2, 2, 2); 
hImageOutput = imshow(snapshot(cam));
title('Output Image');

subplot(2, 2, 3); 
hPlot = plot(0);
title('Gamma Correction Control');
xlabel('Frame');
ylabel('Gamma Value');


frameCount = 0;
while ishandle(hImageInput)
    frameCount = frameCount + 1;

    frame = snapshot(cam);

    frame = im2double(frame);

    meanBrightness = mean(frame(:));

    hImageInput.CData = frame;
    subplot(2, 2, 1);
    title(sprintf('Input Mean Brightness: %.3f', meanBrightness));
    
    % Gamma value based on mean brightness
    gamma = 1;
    if meanBrightness < 0.5
        gamma = 1 / (2 * meanBrightness); % brighten
    elseif meanBrightness > 0.5
        gamma = 2 * (1 - meanBrightness); % darken
    end
    
    % Apply gamma correction
    adjustedFrame = imadjust(frame, [], [], gamma);
    
    meanBrightnessAdjusted = mean(adjustedFrame(:));
    
    % Display adjusted frame
    hImageOutput.CData = adjustedFrame;
    subplot(2, 2, 2);
    title(sprintf('Output Mean Brightness: %.3f', meanBrightnessAdjusted));

    hPlot.XData(end+1) = frameCount;
    hPlot.YData(end+1) = gamma;
    subplot(2, 2, 3);
    title(sprintf('Gamma Value: %.3f', gamma));
    xlabel('Frame');
    ylabel('Gamma Value');
end
