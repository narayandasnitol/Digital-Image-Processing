I = imread('cameraman.png');
[row, col] = size(I);
K = uint8(zeros(row, col));

repValue = 1:256;
for z = 1:256
    count=0;
    for i = 1:row
        for j = 1:col
            if(I(i,j)) == z
                count = count +1;
            end
        end       
    end
    repValue(z) = count;
end


totalPixel = 256*256;
pdf = 1:256;
for x = 1:256
    pdf(x) = repValue(x)/ totalPixel;
end

cdf = 1:256;
cdf_temp = 0;
for x = 1:256
    cdf_temp = cdf_temp + pdf(x);
    cdf(x) = cdf_temp;
end

L = 256;
m = L-1;
for x = 1:256
    cdf(x) = round(cdf(x) * m);
end

for i = 1:256
       for j = 1:256
           K(i,j) = cdf( I(i,j) );
       end
end

repValue2 = 1:256;
for z = 1:256
    count=0;
    for i = 1:row
        for j = 1:col
            if(K(i,j)) == z
                count = count +1;
            end
        end       
    end
    repValue2(z) = count;
end

subplot(2,2,1);
imshow(I);
title('Original Image');

subplot(2,2,2);
bar(repValue, 'blue'), xlabel('Repeated Values'), ylabel('Frequency'), title('Original Histogram');

subplot(2,2,3);
imshow(K);
title('Enhanced Image');

subplot(2,2,4);
bar(repValue2, 'blue'), xlabel('Repeated Values'), ylabel('Frequency'), title('Enhanced Histogram');

    
