k=10
n=[0:k]
x1=sin( (2*pi /10 ) * n )
x2=cos( (2*pi /10 ) * n )
%constants
a=1
b=1
y1=2*x1
y2=2*x2
%y1 and y2 are outputs
x3= a*x1 + b*x2
y3= 2*x3
y4=y3
if(y4 == (a*y1 + b*y2))
    disp('linear')
else
    disp('not linear')
end

subplot(7,1,1)
stem(n,x1)
xlabel('n')
ylabel('x1[n]')

subplot(7,1,2)
stem(n,x2)
xlabel('n')
ylabel('x2[n]')

subplot(7,1,3)
stem(n,y1)
xlabel('n')
ylabel('y1[n]')

subplot(7,1,4)
stem(n,y2)
xlabel('n')
ylabel('y2[n]')

subplot(7,1,5)
stem(n,x3)
xlabel('n')
ylabel('x3[n]')

subplot(7,1,6)
stem(n,y3)
xlabel('n')
ylabel('y3[n]')

subplot(7,1,7)
stem(n,y4)
xlabel('n')
ylabel('y4[n]')