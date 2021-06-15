%q5f

clf
clc
clear

%mov = yuv4mpeg2mov('hall_objects_qcif.y4m');
[mov, fields] = yuv4mpeg2mov('hall_objects_qcif.y4m');

%E=zeros(fields.height,fields.width,fields.frameCount); %empty 3D template
%B=zeros(fields.height,fields.width,fields.frameCount);

v = VideoWriter('hallY.avi');
open(v);

for c=1:fields.frameCount %frameCount is a variable in class fields

    F=rgb2gray( mov(1,c).cdata ); %frame2gray
    F=im2double(F);
    G=imgaussfilt(F,4); %second parameter is sigma
    D=abs(G-F);
    %now we want a threshold

    %set threshold as:
    %"average of each difference frame" = 1/all elements * sum of all elements
    mu_t(c)=mean(D,'all'); %average of current difference frame

    %Attempt to remove small pixels in frame
    for j=1:fields.height
        for k=1:fields.width
            if D(j,k)<mu_t(c) %little change between gaussian and orig,
                B(j,k)=0;
            else
                B(j,k)=F(j,k); %if change, insert and add value to intensity
            end %end if
        end%end k
    end%end j
    
    %Create histogram
    in=B>0;%logic array indices in B where intensity>0
    H(:,c)=imhist(B(in)); %histogram where bins with only nonzeros

    %Compare+store histogram similarity
    if c>1
        S(c)=imhistdistance(H(:,c),H(:,c-1),256); %fix bin at 256

        %temporary
        mu_s=0.999999;%experimenting with different precision gives significant results
        if S(c)>mu_s %recall S(c) is comparison of h(c) and h(c-1)
            
            Y=B; %current B(c) relates to current frame and previous being compared
            writeVideo(v,Y); %write array of frames to stream v
        end
        %note: this algorithm skips the frames that are less similar to the previous frame
        %additional note: similarity is based on cosine similarity of the frames, does
        %not necessarily mean similarity in terms of object placement.
    end

    
end
%now S is filled but programmer needs to see this value to get an idea
mu_s=mean(S,'all'); %mean of all Similarities

        
close(v);
implay('hallY.avi');