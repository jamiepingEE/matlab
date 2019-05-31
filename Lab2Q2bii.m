%define set size using k
k=1
n=0:k
sympref('HeavisideAtOrigin', 1)
d=heaviside(n)-heaviside(n-1)
%functions
x01=n
x02=n
%functions as inputs
x001=a*(x01+5*d)
x002=b*(x02+5*d)
x1=2*x001+5*d
x2=2*x002+5*d
%constants
a=2
b=3
%input-output relation
y1=2*x01+5*d
y2=2*x02+5*d
%y1 and y2 are outputs
x3= x1 + x2
y3= x3
y4=y3
if(y4 == (a*y1 + b*y2))
    disp('linear')
else
    disp('not linear')
end
