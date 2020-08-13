%Lab2p2q1
clear
clc
clf

n=1:10;
%y[n] = x[n] + (1/4)y[n-1]
%input
x(1,10)=0;
x(2:4)=1;

%response
y1=0.25.^(n-1);
for i=1:10
y2(i)=x(i)+y1(i)
end

subplot(3,1,1)
stem(x)
subplot(3,1,2)
stem(y1)
subplot(3,1,3)
stem(y2)