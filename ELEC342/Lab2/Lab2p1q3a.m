%Lab2p1q3a
clear
clc
clf

n=0:10;
x=exp(-2*abs(n)).*sin((2*pi/36)*n)
xm=exp(-2*abs(-n)).*sin((2*pi/36)*(-n))
ye=0.5*(x+xm)
yo=0.5*(x-xm)
subplot(4,1,1)
stem(x)
subplot(4,1,2)
stem(xm)
subplot(4,1,3)
stem(ye)
subplot(4,1,4)
stem(yo)