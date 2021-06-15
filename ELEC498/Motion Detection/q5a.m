%q5a

clf
clc
clear

[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

%E=zeros(fields.height,fields.width,fields.frameCount); %

v = VideoWriter('hallgauss.avi'); %prepare initialize file for write operation
open(v); %open stream

for c=1:fields.frameCount %frameCount is a variable in class fields

F=rgb2gray( mov(1,c).cdata ); %frame2gray
F=im2double(F);
E=imgaussfilt(F,4); %second parameter is sigma
writeVideo(v,F);
end

close(v); %close stream
implay('hallgauss.avi');

