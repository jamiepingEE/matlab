%q3b
clear
clc
clf
%input
I1=imread('p1img.png');
I1g=I1(:,:,2); %third parameter is r, g, or b ,=1, 2, 3. pick green (=2)
I1gdub=im2double(I1g); %uint8 to double
x=I1gdub;

%filter config
%y=filter2(  );

%y = imgaussfilt(x); %gauss 1 default sigma=0.5
y=x;
y = imresize(y,0.5); %downscale 1
imshow(y);
saveas(gcf,'q3b_1.png');

%y = imgaussfilt(y); %gauss 2
y = imresize(y,0.5); %downscale 2
imshow(y);
saveas(gcf,'q3b_2.png');

%y = imgaussfilt(y); %gauss 3
y = imresize(y,0.5); %downscale 3
imshow(y);
saveas(gcf,'q3b_3.png');

%y = imgaussfilt(y); %gauss 4
y = imresize(y,0.5); %downscale 4
imshow(y);
saveas(gcf,'q3b_4.png');