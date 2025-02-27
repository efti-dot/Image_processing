I = imread('C:\Users\eftih\Desktop\cameraman.png');
[row,col] = size(I);
R = I;
F = [0.5, 1, 0.5; 1, 2, 1; 0.5, 1, 0.5];

start = 2;
for i = start : 128
    for j = 128 : 255
        N = double(R(i-1 : i+1, j-1 : j+1));
        K = 0.125*sum(N(:).* F(:));
        I(i,j) = uint8(K);
    end
end
figure;
imshow(I);