%Jamie Ping 27563132 ELEC342 CK-X
%Lab1, q3i

clear
clc
clf

n=[0:4095] %sample along 4 periods
N=1024
x=cos( (2*pi)/N*n ) %x[n]
stem(n,x)

x2=cos( (2*pi)/N*(n+1024) ) %x[n+1024]

%check if x[1]-x[1+1024]
Y=cos( (2*pi)/N*1 ) - cos( (2*pi)/N*(1+1024) )
format long
%returns 0