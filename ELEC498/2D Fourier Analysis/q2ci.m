%q2ci
clear
clc
clf
%input signal
I1=imread('p1img.png');
I1g=I1(:,:,2); %third parameter is r, g, or b ,=1, 2, 3. pick green (=2)
I1gdub=im2double(I1g); %uint8 to double
x=I1gdub;


X=fft2(x);
%note: need filter to be same size as this image



%filter config
%1-D filter
h1 = (1/15)*ones(15,1); 

%if h separable, then h(n1,n2) = h1h2 = h1(n1)h2(n2)
%if h is matrix, h2 must be the transpose, in this case array defined by (1,15)
h2=zeros(1,15);
h2(1,15)=15;
h2(1,14)=30;
h2(1,13)=15;
h2(1,2)=1;

%impulse response is then h(n1,n2) separable: with N1+N2 degrees of freedom
h=h1*h2;

%colormap(parula(64));
%colormap(jet(64));
%mesh(f1,f2,H);
%imshow(H,'InitialMagnification',4000);
H=fft2(h,779,586);


%impulse response
%h=ifft2(ifftshift(H));
%imshow(h);

%time domain filtering output
%y=filter2(h,I1gdub);

%frequency domain filtering
Y=H.*X;
y=ifft2(Y);


subplot(2,2,1);
imshow(x);
title('Original');
subplot(2,2,2);
imshow(log(abs(y)));
title('Filtered Output');

subplot(2,2,3);
imagesc(x);
title('Color-scaled Original');

%freqz2(y);
%imshow(y);
subplot(2,2,4);
imagesc(y);
%mesh(y);
title('Filtered color-scaled Output');

saveas(gcf,'q2ci_imsh.png')