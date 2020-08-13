%lab5pq3

%signal x to be imported to sptool
t=0:25;
x = sin(100*t) + sin(2000*t) + sin(6000*t);
x1=sin(100*t);
x2=sin(2000*t);
x3=sin(6000*t);
x4=x1+x2+x3
hold
plot(t,x1,'r')
plot(t,x2,'g')
plot(t,x3,'b')

