%Lab2p1q2biL
clear
clc

n=0:9
%x=n
%y=.x^2
x1=n;
y1=2*(x1.^2);
x2=n;
y2=2*(x2.^2);
x3=2*x1+2*x2;
y3=(x3.^2)
y4=y1+y2

stem(y3,'r')
hold
stem(y4,'b')