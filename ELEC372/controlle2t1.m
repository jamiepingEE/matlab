%controller2
%(1)Output in response to step input reference of 5 deg
%Theta/Theta(ref)

clc
clear

numk = [240 3];
denk = [80 20];
sysk = tf(numk, denk);

numg = [1];
demg = [400 0 0];
sysg = tf(numg, demg);

sysf = series(sysg, sysk);
sys2 = feedback(sysf, 1);

t = 0:0.01:500;
r=5*ones(size(t));
lsim(sys2,r,t) ;
xlabel('Time');
ylabel('Angle (deg)');
title('Output Angle due to Step Input of 5 Degrees');
