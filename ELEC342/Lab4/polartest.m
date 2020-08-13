%since polar test
clear
clf % clear the current figure
% define the interval over three periods
n = [ 0 :2 : 6*pi ] ;
x = sin(n);
x_rectified = abs(x) ; % obtain a "full-wave rectified" version
 % of the sine wave
subplot(2,1,1)
stem(n,x_rectified)
xlabel('n')
ylabel('x[n]')
subplot(2,1,2)
polar(n, x_rectified);
