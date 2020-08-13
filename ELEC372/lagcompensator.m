%Use parameters of J, B, and K, which you got in Lab #2 
J = 0.0046; B = 0.002; 
K = 5.0; 
%Kp=0.5; Kd=0.01; %for Lead compensator 
Kp=0.5; Kd=0.1; %for Lag compensator 
s = tf('s'); 
G = K/(s*(J*s+B)); 
% PD controller 
C = (Kp+Kd*s);
sisotool