clear
%define x
k=9
n=[1:k]
x1 = n
y1 = x1.^2
%index y1 starts at 0
sum=0
for index = y1
    %0+index
    sum = sum + index;
end
sum1=0
for index = x1
    %0+index
    sum1 = sum1 + index;
end
disp('total energy: sum of y1 unit energy')
disp(sum)
disp('total energy: sum1 of x1 unit energy')
disp(sum1)