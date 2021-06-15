%q1b2
clear
clc
clf

img=imread('house.tiff');
%im=rgb2gray(img); %grayscale
x=im2double(img); %uint8 to double

ref = x;
A = imnoise(ref,'gaussian', 0, 0.00318); %noise 0 mean, about 25dB

[peaksnr, snr] = psnr(A, ref); %Calculate the PSNR.

peaksnr


imhist(x);
title('Histogram of Noisy Grayscale of house');
%imshowpair(x,A,'montage');
%saveas(gcf,'q1b2.png');