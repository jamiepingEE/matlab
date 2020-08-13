%Jamie Ping 27563132 ELEC342 CK-X
%Lab1, q2

clear
clc
clf

y1 = zeros(1,10)
y1(3)=1
y1(8)=1
y2 = zeros(1,10)
y2(4:10)=1

subplot(2,2,1)
stem(-5:4,y1)
subplot(2,2,2)
stem(y1)
subplot(2,2,3)
stem(-5:4,y2)
subplot(2,2,4)
stem(y2)