%q2a2
clear
clc
clf

img=imread('house.tiff');
x=im2double(img); %uint8 to double

E=histeq(x);


imhist(E);
title('Histogram of Equalized Grayscale of house');
%saveas(gcf,'q2a2.png');