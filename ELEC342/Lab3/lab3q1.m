%Lab3q1
clear
clc
clf

n=-10:10;
x(1,21)=0;
x(9:13)=1;
w=[-pi:2*pi/20:pi]
ft=0;

for k=1:21
    sum=0
    for i=1:21
        sum=sum+x(i)*exp(-j*w(k)*n(i))
    end
    ft(k)=sum
end

subplot(2,1,1)
stem(-10:10,x)
subplot(2,1,2)
plot(w,abs(ft))