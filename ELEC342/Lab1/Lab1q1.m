%Jamie Ping 27563132 ELEC342 CK-X
%Lab1, q1

clear
clc
clf

rad=1:10
volsphere=(4/3)*pi*rad.^3
surfacesphere=4*pi*rad.^2

volsquare=rad.^3
surfacesquare=6*rad.^2

subplot(1,2,1)
plot(rad,volsphere,'r')
hold
plot(rad,surfacesphere,'b')
xlabel('radius')
ylabel('volume and surface of sphere')
title('vol&surface sphere')


subplot(1,2,2)
plot(rad,volsquare,'r')
hold
plot(rad,surfacesquare,'b')
xlabel('radius')
ylabel('volume and surface of square')
title('vol&surface square')