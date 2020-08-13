%lab4q3a
clear
clc
Fs=22050;
numBitsPerSample=16;
[x, Fs] = audioread('Original.wav');
%according the workspace, x is already 44100x1 and double data type
%[x, Fs] = audioread('Original.wav', 'double');
%only specifies datatype
%[x, Fs] = audioread('Original.wav', [1 44100]); 
%only means to read the entire track array
[y, Fs] = audioread('Distorted.wav');
subplot(3,1,1)
plot(1:length(y),x)
subplot(3,1,2)
plot(1:length(y),y)
z=y-x;
subplot(3,1,3)
plot(1:length(z),z)