I = imread('C:\Users\eftih\Desktop\image1.png');
if size(I, 3) == 3
    I = rgb2gray(I);
end


A = double(min(I(:)));


B = double(max(I(:)));


D = B - A;
M = 255; 


R = uint8(((double(I) - A) / D) * M + A);


figure;
subplot(1, 2, 1); imshow(I); title('Input Image (I)');
subplot(1, 2, 2); imshow(R); title('Output Image (R)');


imwrite(R, 'T1_Output1_20200204047.png');

inputHist = zeros(1, 256);
outputHist = zeros(1, 256);

for i = 0:255
    inputHist(i + 1) = sum(I(:) == i);
    outputHist(i + 1) = sum(R(:) == i);
end

figure;
subplot(2, 1, 1);
bar(0:255, inputHist, 'k'); title('Histogram of Input Image (I)');
xlabel('Pixel Intensity'); ylabel('Frequency');
subplot(2, 1, 2);
bar(0:255, outputHist, 'r'); title('Histogram of Output Image (R)');
xlabel('Pixel Intensity'); ylabel('Frequency');
