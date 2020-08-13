%lab4q3x
clear
clc
Fs=22050;
numBitsPerSample=16;

[x, Fs] = audioread('Original.wav');
[y, Fs] = audioread('Distorted.wav');


q=fft(x); %fft of original
z=fft(y); %fft of distorted
%q2=fftshift(x);
%z2=fftshift(z);
%r=abs(fftshift(q)); %magn of fft of original for plot purpose
%d=abs(fftshift(z)); %magn of fft of distorted for plot purpose

%Deletion of suspected noise range
%z(11913:32103)=0;
%v=z;

%averaging 3 points method
%v=z;
%for i=11913:32103 
%    %start at second data point
%    v(i)=(z(i-1)+z(i)+z(i+1)); %load new fft
%end


%averaging p points method
%v=z;%load array using z as template
%p=4000; %points to use
%for i=11913:32103
%    sum=0;
%    for k=1:p
%        sum=sum+z(i+k);
%    end
%    v(i+floor(p/2))=sum/p;
%end


%signal to convolve with
%n=1:44100;
%m=sinc(2*pi*n/30);
%l=fft(m)

n=1:44100;
m(1,44100)=0;
m(22050-1:22050+1)=1;
l=fft(m)

%convolving in frequency domain
v=z;
for i=11913:32103 
    %multiply fft of distorted with corrective signal
    v(i)=z(i)*l(i); %load new fft
end

%u=abs(fftshift(v)); %magn of fft of new signal for plot purpose

%ifft of fft or fftshift makes no difference
s=ifft(v); %get back signal from fft



subplot(6,1,1)
plot(1:length(x),x) %plot original
subplot(6,1,2)
plot(1:length(y),y) %plot distorted
subplot(6,1,3)
plot(1:length(q),q) %plot fft of original
subplot(6,1,4)
plot(1:length(z),z) %plot fft of distorted
subplot(6,1,5)
plot(1:length(v),v) %plot fft of after method
subplot(6,1,6)
plot(1:length(s),s) %plot recovered signal

plot(1:length(l),fftshift(l))
sum=0;
for i=1:length(x)
    sum=sum+(x(i)-s(i))^2;
end
MSE=(1/44100)*sum

audiowrite('ifftRecovered.wav',s,Fs,'BitsPerSample',16)
[s, Fs] = audioread('ifftRecovered.wav');
sound(s, Fs , numBitsPerSample);