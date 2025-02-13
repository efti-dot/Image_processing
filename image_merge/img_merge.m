img1 = imread('img1.png');
img2 = imread('img2.png');
img3 = imread('img3.png');


[rows1, cols1, ~] = size(img1);
[rows2, cols2, ~] = size(img2);
[rows3, cols3, ~] = size(img3);

rows = min([rows1, rows2, rows3]);
cols = min([cols1, cols2, cols3]);

img1 = imresize(img1, [rows, cols]);
img2 = imresize(img2, [rows, cols]);
img3 = imresize(img3, [rows, cols]);


left1 = img1(:, 1:floor(cols/2), :);
left2 = img2(:, 1:floor(cols/2), :);
left3 = img3(:, 1:floor(cols/2), :);

red_half = left1;
red_half(:, :, 2:3) = 0;

green_half = left2;
green_half(:, :, [1, 3]) = 0;

blue_half = left3;
blue_half(:, :, 1:2) = 0;

output_image = zeros(rows, floor(cols/2) * 3, 3, 'uint8');
output_image(:, 1:floor(cols/2), :) = red_half;
output_image(:, floor(cols/2)+1:floor(cols/2)*2, :) = green_half;
output_image(:, floor(cols/2)*2+1:end, :) = blue_half;

imshow(output_image);
imwrite(output_image, 'output_image_side_by_side.jpg');
