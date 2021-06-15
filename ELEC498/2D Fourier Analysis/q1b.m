%q1b

clear
clc
clf

I1=imread('p1img.png');
%imshow(I1); %command to test for corrupt image
I1g=I1(:,:,2); %third parameter is r, g, or b ,=1, 2, 3. pick green (=2)
%imshow(I1g); %result: gives greyscale
I1gdub=im2double(I1g); %uint8 to double
%imshow(I1dub);
ft=fftshift(fft2(I1gdub));
z=log( abs(ft) );
p=angle(ft);

%want to get time domain of z and p plot

zt=ifft2(ifftshift(abs(ft)));
pt=ifft2(ifftshift(p));
%TEST fft of phasor components together
%zt=abs(ifft2((ft)));
%pt=ifft2((ft))

subplot(2,2,1);
imshow(z);
title('Magnitude of me');

subplot(2,2,2);
imshow(p);
title('Phase Angle');

subplot(2,2,3);
imshow(zt);
title('Magnitude to Time Domain');

subplot(2,2,4);
imshow(pt);
title('Phase Angle to Time Domain');
%saveas(gcf,'q1b.png')