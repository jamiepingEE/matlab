%example

%x=2;
%y=inc(x,10);

%y
z=[1 2 3]
h=en(z)

function out=en(x)

%x=x.^2;
sum=0;
for i=1:length(x)
    sum=sum+x(i)^2;
end

out=sum;
end
%%
function out=inc(x,b)
    for i=1:b
    x=x+1;
    end
out=x;
end
