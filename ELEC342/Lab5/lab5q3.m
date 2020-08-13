%lab5q3A
clear
clc
clf
Fs=22050;
[k, Fs] = audioread('ELEC342_lab_5_Audio.wav');
%x=orig(:,1);
x=k(1:length(k)/20,1);
fft_x=fft(x);
rect_x=abs(fftshift(fft_x));
xwn=-0.5:1/(length(x)-1):0.5;
%y=audio_down_sampled(:,1);

y=upsample(x,16);
fft_y=fft(y);
rect_y=abs(fftshift(fft_y));
ywn=-0.5:1/(length(y)-1):0.5;
subplot(4,1,1)
plot(x)
subplot(4,1,2)
plot(xwn,rect_x)
subplot(4,1,3)
plot(y)
subplot(4,1,4)
plot(ywn,rect_y)