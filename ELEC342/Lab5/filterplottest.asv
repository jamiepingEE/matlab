%filterplottest
%[b, a] = butter (4, 100,'s'); %order 4, cutoff freq, specify analog otherwise digital
[b,a] = sos2tf(SOS,G); %for exported SOS coefficients
g = tf(b, a) %transfer function of g(z)
%bode(g,{30,4000}); %plot frequency range in rad/s
%grid;

