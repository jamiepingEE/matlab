%controller3
%(3)Output in response due to Disturbance
%Theta/Td = G/(1+KG)

clear
clc

numk = [1400 35];
denk = [40 80];
sysk = tf(numk, denk);

numg = [1];
demg = [400 0 0];

sysg = tf(numg, demg);

sysf = (180/pi)*feedback(sysg, sysk);

%bigger step size to prevent matlab hangs
t = 0:100:172800;
%conversion to deg
r = 10^-4*cosd((7.28*10^-5)*(180/pi)*t);
lsim(sysf,r,t);
xlabel('Time');
ylabel('Angle (Degrees)');
title('Output Angle due to Disturbance During a Period of Two Days');
