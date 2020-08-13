%Lab2p1a1b
clear
clc

n=0:9
x=sin(2*pi/10*n)
y=x.^2
en=0
en2=0
for i=1:10
    en=en+x(i);
    en2=en2+y(i);
end
en
en2