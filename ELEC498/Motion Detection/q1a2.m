%q1a2
clear
clc
clf

img=imread('house.tiff');
x=im2double(img); %uint8 to double

%rgbImage=imread('house.tiff');
% Transforming the image from RGB to YCbCr
%yCbCrImage = rgb2ycbcr(rgbImage);
%[yImage] = imsplit(rgbImage);
%x=im2double(yImage); %uint8 to double

imhist(x);
title('Histogram of Grayscale of house');
%saveas(gcf,'q1a2.png');