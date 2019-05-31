%define set size using k
k=2
n=0:k
%functions
x01=n
x02=n
%functions as inputs
x1=a*x01
x2=b*x02
%constants
a=2
b=3
%input-output relation
y1=x01.^2
y2=x02.^2
%y1 and y2 are outputs
x3= x1 + x2
y3= x3
y4=y3
if(y4 == (a*y1 + b*y2))
    disp('linear')
else
    disp('not linear')
end