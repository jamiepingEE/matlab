%q1b1
clear
clc
clf

img=imread('p1img.png');
im=rgb2gray(img); %grayscale
x=im2double(im); %uint8 to double

ref = x;
A = imnoise(ref,'gaussian', 0, 0.00326); %noise 0 mean, about 25dB

[peaksnr, snr] = psnr(A, ref); %Calculate the PSNR.

peaksnr


imhist(A);
title('Histogram of Noisy Grayscale of Me');
%imshowpair(x,A,'montage');
%saveas(gcf,'q1b.png');

