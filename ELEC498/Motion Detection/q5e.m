%q5e

clf
clc
clear

%mov = yuv4mpeg2mov('hall_objects_qcif.y4m');
[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

%E=zeros(fields.height,fields.width,fields.frameCount); %empty 3D template
%B=zeros(fields.height,fields.width,fields.frameCount);

%v = VideoWriter('hallB.avi');
%open(v);

for c=1:fields.frameCount %frameCount is a variable in the object class "fields"

F=rgb2gray( mov(1,c).cdata ); %frame2gray
F=im2double(F);
G=imgaussfilt(F,4); %second parameter is sigma
D=abs(G-F);
%now we want a threshold

%set threshold as:
%"average of each difference frame" = 1/all elements * sum of all elements
mu_t(c)=mean(D,'all'); %average of the difference frame

    for j=1:fields.height
        for k=1:fields.width
            if D(j,k)<mu_t(c) %little change between gaussian and orig,
                B(j,k)=0;
            else
                B(j,k)=F(j,k); %if change, insert and add value to intensity
            end %end if
        end%end k
    end%end j
 
%get histogram of each B where element not 0
in=B>0;%2D array of indices in B where intensity>0
H(:,c)=imhist(B(in)); %histogram where bins with only nonzeros
%hist is series of rows. H contains all the hist along the row. Row is height of hist(or "hist is a column")
%row size is adjusted

end