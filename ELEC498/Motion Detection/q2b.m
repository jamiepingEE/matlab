%q2b
%absolute mean brightness error
%mean2 then imabsdiff

clear
clc
clf

img=imread('p1img.png');
im=rgb2gray(img); %grayscale
x=im2double(im); %uint8 to double

E=histeq(x);
A=imabsdiff(mean2(x),mean2(E)); %(in, out)

imshowpair(x,E,'montage')
saveas(gcf,'q2bp.png');