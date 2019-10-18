f = imread('fprint.jpg');
f = rgb2gray(f);
f = imbinarize(f,0.3);

subplot(2,3,1);
imshow(f);
title('Original Image');
[x, y] = size(f);

W = [0,1,0;
     1,1,1;
     0,1,0];


R1 = f;
for i = 2:x-1
    for j = 2:y-1        
       N = [f(i-1, j-1)*W(1,1), f(i-1, j)*W(1,2), f(i-1, j+1)*W(1,3), f(i, j-1)*W(2,1), f(i, j)*W(2,2), f(i, j+1)*W(2,3), f(i+1, j-1)*W(3,1), f(i+1, j)*W(3,2), f(i+1, j+1)*W(3,3)];  
       R1(i,j) = min(N);       
    end
end

subplot(2,3,2);
imshow(R1);
title('Erosion');



R2 = f;
for i = 2:x-1
    for j = 2:y-1
       N = [f(i-1, j-1)*W(1,1), f(i-1, j)*W(1,2), f(i-1, j+1)*W(1,3), f(i, j-1)*W(2,1), f(i, j)*W(2,2), f(i, j+1)*W(2,3), f(i+1, j-1)*W(3,1), f(i+1, j)*W(3,2), f(i+1, j+1)*W(3,3)];
       R2(i,j) = max(N);       
    end
end

subplot(2,3,3);
imshow(R2);
title('Dialation');



R3 = R1;
for i = 2:x-1
    for j = 2:y-1
       N = [R1(i-1, j-1)*W(1,1), R1(i-1, j)*W(1,2), R1(i-1, j+1)*W(1,3), R1(i, j-1)*W(2,1), R1(i, j)*W(2,2), R1(i, j+1)*W(2,3), R1(i+1, j-1)*W(3,1), R1(i+1, j)*W(3,2), R1(i+1, j+1)*W(3,3)];
       R3(i,j) = max(N);
    end
end

subplot(2,3,4);
imshow(R3);
title('Opening');



R4 = R2;
for i = 2:x-1
    for j = 2:y-1
       N = [R2(i-1, j-1)*W(1,1), R2(i-1, j)*W(1,2), R2(i-1, j+1)*W(1,3), R2(i, j-1)*W(2,1), R2(i, j)*W(2,2), R2(i, j+1)*W(2,3), R2(i+1, j-1)*W(3,1), R2(i+1, j)*W(3,2), R2(i+1, j+1)*W(3,3)];
       R4(i,j) = min(N);
    end
end

subplot(2,3,5);
imshow(R4);
title('Closing');



subplot(2,3,6);
imshow(R2 - R1);
title('Substitution');