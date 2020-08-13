%homework test

clear
clc
clf

n=0:4;
x(1,5)=0;
x(1:5)=1;

w=[0:2*pi/4:2*pi]
ft=0;

for k=1:5
    sum=0
    for i=1:5
        sum=sum+x(i)*exp(-j*w(k)*n(i))
    end
    ft(k)=sum
end

subplot(3,1,1)
stem(0:4,x)
subplot(3,1,2)
stem(w,abs(ft))
subplot(3,1,3)
stem(w,abs(fft(x)))