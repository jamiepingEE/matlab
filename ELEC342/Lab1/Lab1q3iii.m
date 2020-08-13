%Jamie Ping 27563132 ELEC342 CK-X
%Lab1, q3iii

clear
clc
clf

n=0:31
x1 = cos(pi/4* n + pi/3)
x2 = cos(9*pi/4.*n + pi/3)
%show x1 and x2 are equal to eachother
Y=x1-x2
%Y does not return 0