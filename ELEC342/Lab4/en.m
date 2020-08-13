function out=en(x)

%x=x.^2;
sum=0;
for i=1:length(x)
    sum=sum+x(i)^2;
end

out=sum;
end