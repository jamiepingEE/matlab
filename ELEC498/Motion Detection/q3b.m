%q3b
clear
clc
clf

img=imread('p1img.png');
im=rgb2gray(img); %grayscale
a=im2double(im); %uint8 to double

img2=imread('Pentagon.tiff');%house is already greyscaled
b=im2double(img2); %uint8 to double

f=imhistdistance(a,b,256); %user-specified third parameter
%result notes
%a,a returns 1 regardless of third parameter, which is true
%a,b are 2 different greyscale images that the function converts to
%histogram vector output data