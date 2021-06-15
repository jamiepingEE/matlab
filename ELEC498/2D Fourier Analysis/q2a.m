%q2a

clear
clc
clf

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


ft=fftshift(fft2(h));
z=log( abs(ft) );
p=angle(ft);

subplot(2,2,1);
imshow(h);
title('Original');

subplot(2,2,2);
imshow(abs(ft));
title('FT');

subplot(2,2,3);
imshow(z);
title('Magnitude');

subplot(2,2,4);
imshow(p);
title('Phase Angle');

%saveas(gcf,'q2a.png')