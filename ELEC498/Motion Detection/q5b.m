%q5b

clf
clc
clear

[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

%E=zeros(fields.height,fields.width,fields.frameCount); %

v = VideoWriter('halldiff.avi');
open(v);

for c=1:fields.frameCount %frameCount is a variable in class fields

F=rgb2gray( mov(1,c).cdata ); %frame2gray
F=im2double(F);
G=imgaussfilt(F,4); %second parameter is sigma
D=abs(G-F); %abs subtraction of gray from gauss frame

writeVideo(v,D);
end

close(v);
implay('halldiff.avi');

