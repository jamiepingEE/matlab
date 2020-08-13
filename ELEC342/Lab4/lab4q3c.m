%lab4q3c
clear
clc
Fs=22050;
numBitsPerSample=16;
[x, Fs] = audioread('Original.wav');
[y, Fs] = audioread('Distorted.wav');

%z=y-x;
ft_y=fft(y); %fourier transform of distorted
z=abs(ft_y); %magnitude of FT

for i=1:length(ft_y)
if ft_y<mean(z)
    ft_y(i)=0; %remove frequency
end
end
r=ifft(ft_y); %transform the frequency back

audiowrite('Recovered.wav',r,Fs,'BitsPerSample',16)
[r, Fs] = audioread('Recovered.wav');
sound(r, Fs , numBitsPerSample);

subplot(3,1,1)
plot(1:length(y),y) %plot original
subplot(3,1,2)
plot(1:length(z),z) %plot mean of signal
subplot(3,1,3)
plot(1:length(r),r) %plot recovered
