img = imread('C:\Users\eftih\Desktop\cameraman.png');

filter_size = 13; 
half_size = (filter_size - 1) / 2;

if ndims(img) == 3
    img = rgb2gray(img); 
end
img = double(img); 

[rows, cols] = size(img); 
padded_img = zeros(rows + filter_size - 1, cols + filter_size - 1); 
padded_img(half_size+1:end-half_size, half_size+1:end-half_size) = img;

mean_filtered_img = zeros(rows, cols);
median_filtered_img = zeros(rows, cols);

for i = 1:rows 
    for j = 1:cols 
        region = padded_img(i:i+filter_size-1, j:j+filter_size-1); 
        mean_filtered_img(i, j) = mean(region(:)); 
        median_filtered_img(i, j) = median(region(:)); 
    end
end

mean_filtered_img = uint8(mean_filtered_img); 
median_filtered_img = uint8(median_filtered_img); 

figure; 
subplot(1,3,1), imshow(uint8(img)), title('Original Image');
subplot(1,3,2), imshow(mean_filtered_img), title('Mean Filtered Image');
subplot(1,3,3), imshow(median_filtered_img), title('Median Filtered Image');