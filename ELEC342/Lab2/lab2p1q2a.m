%Lab2p1q2a
clear
clc
clf

n=0:10
%x=n
%y=2*x
x1=sin(2*pi/10*n)
y1=2*x1
x2=cos(2*pi/10*n)
y2=2*x2
x3=x1+x2
y3=2*x3
y4=y1+y2

stem(y3,'r')
hold
stem(y4,'b')