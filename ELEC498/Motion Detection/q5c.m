%q5c

clf
clc
clear

[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

for c=1:fields.frameCount %frameCount is a variable in class fields

F=rgb2gray( mov(1,c).cdata ); %frame2gray
F=im2double(F);
G=imgaussfilt(F,4); %second parameter is sigma
D=abs(G-F);
%now we want a threshold

%set threshold as:
%"average of each difference frame" = 1/all elements * sum of all elements
mu_t(c)=mean(D,'all'); %average of the difference frame
%mu_t is an array of 330 mean frame intensities

end

