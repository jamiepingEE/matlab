%sampletest
clear
clc
clf

n=-10:10;
x(1,21)=0;
x(9:13)=1;

w=-pi:2*pi/(length(n)-1):pi;

ft=FT(n,x,w)
X=abs(fftshift(fft(x)))
subplot(3,1,1)
stem(n,x)
subplot(3,1,2)
plot(w,abs(ft))
subplot(3,1,3)
plot(w,X)