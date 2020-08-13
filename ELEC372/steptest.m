clc;
clear;

segments=64

for value=1:step:n
x1=value



y1=exp(-(x1).^2);


N=length(x1)-1;
h=(1-0)/(N);
% Integrate by Simpon's 1/3 method using Eq. (7.19)
I(i)=h/3*(y1(1)+4*sum(y1(2:2:N))+2*sum(y1(3:2:(N-1)))+y1(N+1))



