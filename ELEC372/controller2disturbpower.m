%controller2
%(3)Output in response due to Disturbance
%Theta/Td = G/(1+KG)

clear
clc

numk1 = [240 3];
denk1 = [80 20];
sysk1 = tf(numk1, denk1);

numg1 = [1];
demg1 = [400 0 0];
sysg1 = tf(numg1, demg1);


sysf1 = (180/pi)*feedback(sysg1, sysk1);
%bigger step size to prevent matlab hangs
t = 0:100:172800;
%t=linspace(0, 172800);

%conversion to deg
r = 10^-4*cosd((7.28*10^-5)*(180/pi)*t);

ass1=lsim(sysf1,r,t);

%controller2
%(4)Control Torque in response to Disturbance
%Theta/Td = -KG/(1+KG)

numk2 = [240 3];
denk2 = [80 20];
sysk2 = tf(numk2, denk2);

numg2 = [1];
demg2 = [400 0 0];
sysg2 = tf(numg2, demg2);

sysf2= -1*series(sysg2, sysk2);
sys2 = feedback(sysf2,1,1);
%conversion to deg
u = 10^-4*cosd((7.28*10^-5)*(180/pi)*t);
ass2=lsim(sys2,u,t);
%B=ilaplace(ass2,s,t);
deriv_ass1=diff(ass1)./diff(t);

%newass=deriv_ass1.*ass2;
%plot(newass)


%A=diff(f)./diff(t);
%B = v;

%combine t*d(theta)

%Z = A.*B
%figure(1);
%plot(t, Z);
%grid;
%xlabel('t');
%ylabel('Z');