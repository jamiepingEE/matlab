%controller3
%(2)Control Torque in response to 5 deg input
%Test on Tc/Theta(ref)

clear
clc

numk = [1400 35];
denk = [40 80];
sysk = tf(numk, denk)

numg = [1];
demg = [400 0 0];
sysg = tf(numg, demg);

sys2 = feedback(sysk, sysg);

t = 0:0.01:100;
y = step(sys2, t);
r = 5*ones(size(t));
lsim(sys2,r,t);
xlabel('Time');
ylabel('Torque (N.m)');
title('Control Torque due to Step Input of 5 Degrees');
