%q5d
clf
clc
clear

[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

v = VideoWriter('hallB.avi');
open(v);

for c=1:fields.frameCount %frameCount is a variable in class fields

F=rgb2gray( mov(1,c).cdata ); %frame2gray
F=im2double(F);
G=imgaussfilt(F,4); %second parameter is sigma
D=abs(G-F);

mu_t(c)=mean(D,'all'); %average intensity of the difference frame

%attempt to remove low intensity pixel change based on avg as threshold
    for j=1:fields.height
        for k=1:fields.width
            if D(j,k)<mu_t(c) %little change between gaussian and orig,
                B(j,k)=0;
            else
                B(j,k)=F(j,k); %if change, insert and add value to intensity
            end %end if
        end%end k
    end%end j

writeVideo(v,B); %write array of frames to stream v
end

close(v);
implay('hallB.avi');
%note: this method(explain mu_t) will fail because the variation in difference is
%dependant on the sigma of the gaussian filter in this algorithm. The gaussian filter caused
%the edge values to spread out as a larger region, and also causing some
%artifacts present in the original frame to spread out larger(or amplify), resulting in
%unwanted detection of static(noise). In the hall_object motion frame
%sequence, background objects are not zeroed; by common sense, walls and
%ceilings should not move.