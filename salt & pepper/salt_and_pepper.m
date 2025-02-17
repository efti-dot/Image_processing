I = imread('C:\Users\eftih\Desktop\cameraman.png');
[row, col] = size(I);

R = imnoise(I, 'salt & pepper', 0.01);

S = R; 

x = 3;
mid = floor(x/2); 
start = mid + 1;

half_col = floor(col/2);


row_end = row - mid; 
col_end = half_col - mid;


for i = start : row_end
    for j = start : col_end
        N = double(R(i-mid:i+mid, j-mid:j+mid)); 
        t = median(N(:));  
        S(i, j) = uint8(t); 
    end
end


col_end = col - mid;

for i = start : row_end
    for j = half_col : col_end
        N = double(R(i-mid:i+mid, j-mid:j+mid)); 

        t3 = min(N(:)); 

        S(i, j) = uint8(t3);
    end
end

subplot(1, 3, 1);
imshow(I);
title('Gray Image');

subplot(1, 3, 2);
imshow(R);
title('Noisy Image');

subplot(1,3,3);
imshow(S);
title('Final Image');

imwrite(uint8(S), 'A2_20200204047.png');

