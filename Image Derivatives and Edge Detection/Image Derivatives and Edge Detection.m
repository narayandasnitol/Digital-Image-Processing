f = imread('coins.jpg');
f = rgb2gray(f);
f = im2double(f);
subplot(2,2,1);
imshow(f);
title('Original Image');


[x, y] = size(f);
W = [1,1,1;
     1,-8,1;
     1,1,1];


R1 = zeros(x,y);
for i = 2:x-1
    for j = 2:y-1        
       N = [f(i-1, j-1)*W(1,1), f(i-1, j)*W(1,2), f(i-1, j+1)*W(1,3), f(i, j-1)*W(2,1), f(i, j)*W(2,2), f(i, j+1)*W(2,3), f(i+1, j-1)*W(3,1), f(i+1, j)*W(3,2), f(i+1, j+1)*W(3,3)];  
       R1(i,j) = sum(N(:));       
    end
end;

subplot(2,2,2);
imshow(R1);
subplot(2,2,3)
imshow(f-R1)




