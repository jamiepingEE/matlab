%lab4q3d
clear
clc
Fs=22050;
numBitsPerSample=16;
[x, Fs] = audioread('Original.wav');
[r, Fs] = audioread('Recovered.wav');
%sound(r, Fs , numBitsPerSample);
%sound(y, Fs , numBitsPerSample);
sum=0
for i=1:length(x)
    sum=sum+(x(i)-r(i))^2;
end
MSE=(1/44100)*sum