f = imread('cameraman.png');
%f = rgb2gray(f);
f = im2double(f);
subplot(2,2,1);
imshow(f);
title('Original Image');
[x, y] = size(f);


W1 = [-1,-2,-1;
     0,0,0;
     1,2,1];
 
 W2 = [-1,0,1;
     -2,0,2;
     -1,0,1];


R1 = zeros(x,y);
for i = 2:x-1
    for j = 2:y-1        
       N = [f(i-1, j-1)*W1(1,1), f(i-1, j)*W1(1,2), f(i-1, j+1)*W1(1,3), f(i, j-1)*W1(2,1), f(i, j)*W1(2,2), f(i, j+1)*W1(2,3), f(i+1, j-1)*W1(3,1), f(i+1, j)*W1(3,2), f(i+1, j+1)*W1(3,3)];  
       R1(i,j) = sum(N(:));       
    end
end;

R2 = zeros(x,y);
for i = 2:x-1
    for j = 2:y-1        
       N = [f(i-1, j-1)*W2(1,1), f(i-1, j)*W2(1,2), f(i-1, j+1)*W2(1,3), f(i, j-1)*W2(2,1), f(i, j)*W2(2,2), f(i, j+1)*W2(2,3), f(i+1, j-1)*W2(3,1), f(i+1, j)*W2(3,2), f(i+1, j+1)*W2(3,3)];  
       R2(i,j) = sum(N(:));       
    end
end;


subplot(2,2,2)
imshow(R1+R2);
subplot(2,2,3)
imshow(R1+R2-f);
subplot(2,2,4)
imshow(R1+R2+f);




