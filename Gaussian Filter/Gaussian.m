img = imread('C:\Users\eftih\Desktop\cameraman.png');

sigma = input('Sigma = '); 
filter_size = 13; 
half_size = (filter_size - 1) / 2;
X = -half_size:half_size;
Y = -half_size:half_size; 
G = zeros(filter_size); 
for i = 1:filter_size 
    for j = 1:filter_size 
        x = X(j); y = Y(i);
        G(i,j) = exp(-(x^2 + y^2) / (2*sigma^2)) / (2*pi*sigma^2); 
    end
end

G = G / sum(G(:));

if ndims(img) == 3
    img = rgb2gray(img); 
end
img = double(img); 
[rows, cols] = size(img); 
padded_img = zeros(rows + filter_size - 1, cols + filter_size - 1); 
padded_img(half_size+1:end-half_size, half_size+1:end-half_size) = img;
filtered_img = zeros(rows, cols);
for i = 1:rows 
    for j = 1:cols 
        region = padded_img(i:i+filter_size-1, j:j+filter_size-1); 
        filtered_img(i, j) = sum(region(:) .* G(:)); 
    end
end
filtered_img = uint8(filtered_img); 
figure; 
subplot(1,2,1), 
imshow(uint8(img)), 
 
subplot(1,2,2), 
imshow(filtered_img), 
