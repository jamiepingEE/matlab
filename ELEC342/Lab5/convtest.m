[b,a] = sos2tf(SOS,G); %for exported SOS coefficients



n1=0:1/(8192):3; %8192 points per second +1 including very first array
n2=1:1/8192:3;
n3=2:1/8192:3;

x1=sin(2*pi*200*n1);
x2=sin(2*pi*330*n2);
x3=sin(2*pi*480*n3);
%x=x1+x2+x3
%filtered
f1=filter(b,a,x1);
f2=filter(b,a,x2);
f3=filter(b,a,x3);
