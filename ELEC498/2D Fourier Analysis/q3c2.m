%q3c2


clear
clc
clf
%input
I1=imread('barbara.png');
I1g=I1(:,:); %third parameter is r, g, or b ,=1, 2, 3. pick green (=2)
I1gdub=im2double(I1g); %uint8 to double
x=I1gdub;

%filter config
%y=filter2(  );

y = imboxfilt(x); %gauss 1 default sigma=0.5
y = imresize(y,0.5); %downscale 1
imshow(y);
saveas(gcf,'q3c2_1.png');

y = imboxfilt(y); %gauss 2
y = imresize(y,0.5); %downscale 2
imshow(y);
saveas(gcf,'q3c2_2.png');

y = imboxfilt(y); %gauss 3
y = imresize(y,0.5); %downscale 3
imshow(y);
saveas(gcf,'q3c2_3.png');

y = imboxfilt(y); %gauss 4
y = imresize(y,0.5); %downscale 4
imshow(y);
saveas(gcf,'q3c2_4.png');
