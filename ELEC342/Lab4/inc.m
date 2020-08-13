function b=inc(a,n) %receive input x and function call
%persistent x; %equivalent to pass by reference in c++ or inc(datatype &x)
x=a
if isempty(x)
    x=0;
end

for i=1:n
x = x + 1; %do this to x
end

b=x %function output returns x;
