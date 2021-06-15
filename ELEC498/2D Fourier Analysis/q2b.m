%q2bi

clear
clc
clf
%input
%X = ones(15);

%X = zeros(15);
%X(3:10,3:10) = 0;
%mesh(X)
%imshow(X);
%imagesc(X);

%filter
f1=[0:6.28];
f2=f1;
H = ones(15); %test target layout
[f1,f2] = freqspace(15,'meshgrid');

%best thick ring config
r = (f1.^2 + f2.^2); 
H((r<0.3)|(r>0.7)) = 0; %circular bandpass radius between 2 limits


%best fine ring config
%r = sqrt(f1.^2 + f2.^2); 
%H((r<0.7)|(r>0.8)) = 0; %circular bandpass radius between 2 limits

%colormap(parula(64))
%colormap(jet(64))
%mesh(f1,f2,H)
%imshow(H);
%imshow(H,'InitialMagnification',4000)
Hp=angle(H);
%imshow(Hp,'InitialMagnification',4000)
%imagesc(Hp);
%mesh(Hp);

%impulse response
h=ifft2(ifftshift(H));
%imshow(h)

%imshow(h,'InitialMagnification',4000)
%imagesc(h)
%mesh(h)


%Y=filter2(H,A);

subplot(2,2,1);
imshow(h);
title('Original');

subplot(2,2,2);
imshow(H);
title('FT');

subplot(2,2,3);
imshow(abs(H));
title('Magnitude');

subplot(2,2,4);
imshow(Hp);
title('Phase Angle');

saveas(gcf,'q2b.png')