n=-10:10;
x1=-power(n,n-1)
k=21
x2=zeros(1,k)
for index = 1:k;
    x2(index) = x1(k+1 -index);
end

subplot(4,1,1)
stem(n,x1)
axis([0 10 -inf inf])
xlabel('n')
ylabel('x1[n]')

subplot(4,1,2)
stem(n,x2)
axis([0 10 -inf inf])
xlabel('n')
ylabel('x2[n]')

even_comp=0.5*(x1+x2)
odd_comp=0.5*(x1-x2)

subplot(4,1,3)
stem(n,even_comp)
axis([0 10 -inf inf])
xlabel('n')
ylabel('even component')

subplot(4,1,4)
stem(n,odd_comp)
axis([0 10 -inf inf])
xlabel('n')
ylabel('odd component')