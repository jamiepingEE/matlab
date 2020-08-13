%lab4q3b
clear
clc
Fs=22050;
numBitsPerSample=16;
[x, Fs] = audioread('Original.wav');
[y, Fs] = audioread('Distorted.wav');
%sound(y, Fs , numBitsPerSample);
sum=0
for i=1:length(x)
    sum=sum+(x(i)-y(i))^2;
end
MSE=(1/44100)*sum