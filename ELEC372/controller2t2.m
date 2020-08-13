%controller2
%(2)Control Torque in response to 5 deg input
%Test on Tc/Theta(ref)

clear
clc

numk = [240 3];
denk = [80 20];
sysk = tf(numk, denk);

numg = [1];
demg = [400 0 0];
sysg = tf(numg, demg);


sys2 = feedback(sysk, sysg);

t = 0:0.01:200;
r = 5*ones(size(t));
lsim(sys2,r,t);
xlabel('Time');
ylabel('Angle (Degrees)');
title('Control Torque due to Step Input of 5 Degrees');
