%q2cii
clear
clc
clf
%input
I1=imread('p1img.png');
I1g=I1(:,:,2); %third parameter is r, g, or b ,=1, 2, 3. pick green (=2)
I1gdub=im2double(I1g); %uint8 to double
x=I1gdub;

X=fft2(x);

%P=padarray(I1gdub,[21 214],0,'pre')
%X=fftshift(fft2(P));
%note: need filter to be same size as this image



%filter config
f1=[0:6.28];
f2=f1;
H = ones(15); %test target layout
[f1,f2] = freqspace(15, 'meshgrid');
%H = ones(800); %test target layout
%[f1,f2] = freqspace(800, 'meshgrid');


%best thick ring config
%r = (f1.^2 + f2.^2); 
%H((r<0.3)|(r>0.7)) = 0; %circular bandpass radius between 2 limits

%best fine ring config
r = sqrt(f1.^2 + f2.^2); 
H((r<0.7)|(r>0.8)) = 0; %circular bandpass radius between 2 limits
%H((r<0.2)|(r>0.8)) = 0;

H=fft2(ifft2(H),779,586);

%colormap(parula(64));
%colormap(jet(64));
%mesh(f1,f2,H);
%imshow(H,'InitialMagnification',4000);




%impulse response
%h=ifft2(ifftshift(H));
%imshow(h);

%time domain filtering output
%y=filter2(h,I1gdub);

%frequency domain filtering
Y=H.*X;
y=ifft2(Y);


imshow(abs(y));
%imagesc(abs(y));
%mesh(y)
saveas(gcf,'q2cii_imsh.png')

%imagesc(abs(y));
%saveas(gcf,'q2cii_imsc.png')