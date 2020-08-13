%lab5pq1

fs=22050;
numBitsPerSample=16;
[y,fs]=audioread('lab_5_Audio_1.wav');
%sound(y, fs , numBitsPerSample);

%sound(y,fs)
%sound(0.25*y,fs) %lower volume
%sound(4*y,fs) %louder and cracking
%sound(y, fs/2) %very sluggish rate
sound(y, fs*2) %at a faster rate