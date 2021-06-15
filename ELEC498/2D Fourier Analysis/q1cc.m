%q1cc

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

%want to get time domain of z and p plot

%zt=ifft2(abs(ft));
%pt=abs(ifft2(p));
%TEST 2D ifft of phasor components together
zt=ifft2(ifftshift(ft));
%pt=ifft2((ft))

subplot(2,2,1);
imshow(I1);
title('Original');

subplot(2,2,2);
imshow(abs(ft));
title('FT of Barbara');

subplot(2,2,3);
imshow(zt);
title('IFT of FT');

%saveas(gcf,'q1cc.png')