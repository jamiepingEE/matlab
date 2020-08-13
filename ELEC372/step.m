numk = [240 3];
denk = [80 20];
sysk = tf(numk, denk)

numg = [1];
demg = [400 0 0];
sysg = tf(numg, demg)

sysf = series(sysg, sysk);
sys2 = feedback(sysf, 1);

t = 0:0.01:500;
y = step(sys2, t);
plot(t,y)
xlabel('Time (Seconds)')
ylabel('Angle (deg)')
title('Spacecraft Control Torque Output due to Step Input of 5 deg')
