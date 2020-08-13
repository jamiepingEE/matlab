%Lab2p1q3b
clear
clc
clf

n=-5:5;
x=(-1).^(n-1);
xm=(-1).^(-n-1);
ye=0.5*(x+xm);
yo=0.5*(x-xm);

subplot(4,1,1)
stem(-5:5,x)
subplot(4,1,2)
stem(-5:5,xm)
subplot(4,1,3)
stem(-5:5,ye)
subplot(4,1,4)
stem(-5:5,yo)