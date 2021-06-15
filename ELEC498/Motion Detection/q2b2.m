%q2b2
clear
clc
clf

img=imread('house.tiff');
x=im2double(img); %uint8 to double

E=histeq(x);
A=imabsdiff(mean2(x),mean2(E)); %(in, out)

imshowpair(x,E,'montage')
saveas(gcf,'q2bp2.png');