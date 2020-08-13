%Lab2p2q2
clear
clc
clf

n=1:10;
x(n)=0;
x(2:4)=1;
format long
for i=1:10
    h(i)=0.25^n(i);
end

c=conv(h,x)
length MAX([LENGTH(A)+LENGTH(B)-1,LENGTH(A),LENGTH(B)]);
subplot(3,1,1)
stem(x)
subplot(3,1,2)
stem(h)
subplot(3,1,3)
stem(c)