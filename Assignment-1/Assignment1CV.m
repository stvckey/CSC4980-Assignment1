clear;
clc;

obj = imread('circleDiameterEx.jpg');
imshow(obj)

red = obj(:,:,1);;

subplot(2,2,1); imshow(obj); title('Original Image');
subplot(2,2,2); imshow(red); title('Red Plane');

level = 0.37;
bw2 = im2bw(red, level);
subplot(2,2,1); imshow(bw2); title('blue plane threholded');

diameter = regionprops(red,'MajorAxisLength')

imshow(red)
d=imdistline
disp(diameter)

