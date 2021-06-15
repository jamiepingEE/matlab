%q2a1
clear
clc
clf

img=imread('p1img.png');
im=rgb2gray(img); %grayscale
x=im2double(im); %uint8 to double

E=histeq(x);


imhist(E);
title('Histogram of Equalized Grayscale of Me');
%saveas(gcf,'q2a1.png');