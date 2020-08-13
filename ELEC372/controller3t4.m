%controller3
%(4)Control Torque in response to Disturbance
%Theta/Td = -KG/(1+KG)

clear
clc

numk = [1400 35];
denk = [40 80];
sysk = tf(numk, denk);

numg = [1];
demg = [400 0 0];
sysg = tf(numg, demg);

sysf= -1*series(sysg, sysk);

sys2 = feedback(sysf,1,1);
%bigger step size to prevent matlab hangs
t = 0:100:172800;
%conversion to deg
u = 10^-4*cosd((7.28*10^-5)*(180/pi)*t);
lsim(sys2,u,t);
xlabel('Time');
ylabel('Torque (N.m)');
title('Torque Control Due to Disturbance During a Period of 2 days');
