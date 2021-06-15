%q1aa

clear
clc
clf

I1=imread('barbara.png');
%imshow(I1); %command to test for corrupt image
I1g=I1(:,:); %third parameter is r, g, or b ,=1, 2, 3. pick none
%imshow(I1g); %result: gives greyscale
I1gdub=im2double(I1g); %uint8 to double
%imshow(I1dub);
%ft=fftshift( fft2(I1gdub) );
ft=fftshift(fft2(I1gdub));
z=log( abs(ft) );
p=angle(ft);

subplot(2,2,1);
imshow(I1);
title('Original');

subplot(2,2,2);
imshow(I1gdub);
title('Data Conversion to double');

subplot(2,2,3);
imshow(z);
title('Magnitude');

subplot(2,2,4);
imshow(p);
title('Phase Angle');
%saveas(gcf,'q1aa.png')