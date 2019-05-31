clear
subplot(2,2,2);
x1=1:9;
y1=zeros(1,9);
y1(1)=1;
y1(4)=1;
stem(x1,y1,'b');
title("0 to 9")

subplot(2,2,4);
x2=1:9;
y2=ones(1,9);
n=5;
y2(1:n)=0;
stem(x2,y2,'b');
title("0 to 9")

subplot(2,2,1);
x3=-6:4;
%limits from 0 to j is of size k+1 = b-a+1 = 4+6+1 =11
y3=zeros(1,11);
y3(1)=1;
y3(4)=1;
stem(x3,y3,'b');

subplot(2,2,3);
x4=-6:4;
y4=ones(1,11);
n4=5;
y4(1:n4)=0;
stem(x4,y4,'b');
