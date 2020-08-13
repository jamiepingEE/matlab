function out=countme()
persistent n;
if isempty(n)
    n=0;
end
n=n+1;
out=n
end