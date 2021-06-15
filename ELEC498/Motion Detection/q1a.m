%q1a2
clear
clc
clf

%img=imread('p1img.png');
%im=rgb2gray(img); %grayscale
%x=im2double(im); %uint8 to double

rgbImage=imread('p1img.png');
% Transforming the image from RGB to YCbCr
yCbCrImage = rgb2ycbcr(rgbImage);
[yImage, crImage, cbImage] = imsplit(yCbCrImage);
x=im2double(yImage); %uint8 to double

imhist(x);
title('Histogram of Grayscale of me');
%saveas(gcf,'q1a1.png');