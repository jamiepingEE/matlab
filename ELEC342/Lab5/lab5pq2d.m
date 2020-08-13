%lab5pq2d
format long
[b,a] = sos2tf(SOS,G); %convert exported SOS coefficients to (numerator, denominator)
g = tf(b, a); %transfer function of g(z)
%bode(g,{30,4000}); %plot frequency range in rad/s
%grid;

%zplane(b,a); %zero plot of original tf

zplane(round(b,1),round(a,1));
