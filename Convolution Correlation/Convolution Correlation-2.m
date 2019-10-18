I = imread('coins.png');
% I2 = imnoise(I,'salt & pepper', 0.02);
I2 = imnoise(I,'gaussian', 0.02);
[row, col] = size(I2);
I3 = I2;


for i = 1:row-2
    for j = 1:col-2
        N = I2(i:i+2, j:j+2);
       % t = max(N(:));
       % t = min(N(:));
       % t = median(N(:));
        t = mean(N(:));
       
        I3(i+1, j+1) = t;    
    end
end

subplot(2,2,1);
imshow(I2);
title('Original Image');

subplot(2,2,2);
imshow(I3);
title('Filtered Image');