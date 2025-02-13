inputImage = imread('C:\Users\eftih\Desktop\image1.png');
if size(inputImage, 3) == 3
    inputImage = rgb2gray(inputImage);
end

[rows, cols] = size(inputImage);
bitPlanes = zeros(rows, cols, 8, 'uint8');

for i = 1:8
    bitPlanes(:, :, i) = bitget(inputImage, i) * 255;
end

selectedPlanes = [1, 2, 7, 8];

figure;
subplot(2, 3, 1); imshow(inputImage); title('Original Image');
for i = 1:length(selectedPlanes)
    subplot(2, 3, i + 1);
    imshow(bitPlanes(:, :, selectedPlanes(i)));
    title(['Bit Plane ', num2str(selectedPlanes(i))]);
    
    imwrite(bitPlanes(:, :, selectedPlanes(i)), ['T2_Output', num2str(i), '_20250204047.png']);
end
