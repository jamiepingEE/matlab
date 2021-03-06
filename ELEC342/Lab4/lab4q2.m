%lab4q2
clear
clc
clf

prompt=('enter periods n');
p=3%input(prompt); %interval period

for i=1:5
    prompt=('enter sampling rate N, used as multiplier of nyquist rate; N*(2fmax)');
    samp=input(prompt);
    N=floor(samp); %restrict sampling to integer
    %N is the Samples per period(or sample rate)
    %nyquist rate fs>=2fmax
    %n is the interval of an amount of data points
    n=0:p*N;
    N0=length(n)-1; %sample rate
    %step size is dependant and limited on data storage, 
    %so this value must be
    %restricted and interval n must be known
    step=p*2*pi/(N0);
    w=-p*pi:step:p*pi;
    x0=0.5*sin(2*pi/N * n) + 0.33* sin(4*pi/N*n)
    x=abs(x0)
    ft_x=FT(n,x,w);
    figure
    subplot(3,1,1)
    stem(n,x)
    subplot(3,1,2)
    polar(w,abs(ft_x))
    subplot(3,1,3)
    polar(n,x)
end

function out=FT(m,a,W)
%take in arguments (interval,input signal,angular frequency interval)
    for k=1:length(W)
    sum=0;
     for i=1:length(a)
     sum=sum+a(i)*exp(-j*W(k)*m(i));
     end
    ft(k)=sum;
    end
out=ft; %return array containing resulting fourier series
end