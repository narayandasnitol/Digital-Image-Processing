sigma = 0.6;

X = [-1,0,1; -1,0,1; -1,0,1;];
Y = [-1,-1,-1; 0,0,0; 1,1,1];

a = 1 / (2 * 3.1416 * sigma^2);
b = -(X.^2 + Y.^2) / (2*sigma^2);

g_kernel = a*exp(b);


I = imread('coins.png');
I2 = imnoise(I,'gaussian', 0.02);

[row, col] = size(I2);
I3 = double(I2);


results = zeros(3,3);
for i = 1:row-2
    for j = 1:col-2
        N = I2(i:i+2, j:j+2);
       
        for p = 1:3
            for q= 1:3
                results(p,q) = g_kernel(p,q) * double(N(p,q));                
            end
        end
        
        t = sum(results(:));
        I3(i+1, j+1) = t;      
        
    end
end

imshow(I3);