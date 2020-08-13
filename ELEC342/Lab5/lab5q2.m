%lab5q2
%clear
clc
clf
[b,a] = sos2tf(SOS,G);
n1=0:1/8192:3; %8192 points per second +1 including very first array
n2=1:1/8192:3;
n3=2:1/8192:3;

x1=sin(2*pi*200*n1);
x2=sin(2*pi*330*n2);
x3=sin(2*pi*480*n3);

f1=filter(b,a,x1);
f2=filter(b,a,x2);
f3=filter(b,a,x3);


%sound(x1) 
%sound(x2) 
%sound(x3) 

%hold
figure
subplot(6,1,1)
plot(x1,'r')
subplot(6,1,2)
plot(x2,'g')
subplot(6,1,3)
plot(x3,'b')
subplot(6,1,4)
plot(f1,'r')
subplot(6,1,5)
plot(f2,'g')
subplot(6,1,6)
plot(f3,'b')

figure
subplot(6,1,1)
plot(-0.5:1/(length(x1)-1):0.5,abs(fftshift(fft(x1))),'r')
subplot(6,1,2)
plot(-0.5:1/(length(x2)-1):0.5,abs(fftshift(fft(x2))),'g')
subplot(6,1,3)
plot(-0.5:1/(length(x3)-1):0.5,abs(fftshift(fft(x3))),'b')
subplot(6,1,4)
plot(-0.5:1/(length(f1)-1):0.5,abs(fftshift(fft(f1))),'r')
subplot(6,1,5)
plot(-0.5:1/(length(f2)-1):0.5,abs(fftshift(fft(f2))),'g')
subplot(6,1,6)
plot(-0.5:1/(length(f3)-1):0.5,abs(fftshift(fft(f3))),'b')
