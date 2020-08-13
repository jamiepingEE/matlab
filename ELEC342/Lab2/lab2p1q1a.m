%lab2p1q1a
clear
clc

n=0:9
x=n
y=x.^2
en=0
en2=0
for i=1:10
    en=en+x(i)
    en2=en2+y(i)
end
en
en2