%finalbuild1
%low-light enhancement motion segmentation

clc;
close all;
clear;

%change these 2 only
[mov, fields] = yuv4mpeg2mov('v5.y4m'); %input .y4m file
fname='v5.avi' %specify output .avi file name

v = VideoWriter(fname); %prepare initialize file for write operation
open(v); %open stream

%start frameseek
for c=1:fields.frameCount %frameCount is a variable in class fields
    %initialize current frame from video
    A1=mov(1,c).cdata; %frame2gray
    A1g=imgaussfilt(A1,2);
    A2=imresize(A1g,0.1);
    A3=im2double(A2);
    %enhance current
    A4= LECARM(A3,CameraModels.Sigmoid());
    A5=im2uint8(A3);
    
    %A5=A2;
    
    A=rgb2gray(A5);
    
    if c>1
    %A0= mov(1,c-1).cdata ; %very bad for noisy video
    %initialize background frame from video
    A01=mov(1,1).cdata; %use first frame as ref for better for noisy video
    A01g=imgaussfilt(A01,2);
    A02=imresize(A01g,0.1);
    A03=im2double(A02);
    %enhance background
    A04 = LECARM(A03, CameraModels.Sigmoid());
    A05=im2uint8(A03);
    
    %A05=A02;
    
    A0=rgb2gray(A05); %XOR should discriminate in grayscale

    %initialize frames to be processed
    Background=A0;
    CurrentFrame=A;
    
    GBg=imgaussfilt(Background,0.5);%refilter, but also amplifies noise
    GCf=imgaussfilt(CurrentFrame,0.5);

    %get xor
    [Bg]=round(GBg);%xor takes whole integers
    [Cf]=round(GCf);
    xOut = bitxor(Bg,Cf); %disp pixel of one or the other

    %Convert RGB 2 GRAY? No
    %Out=rgb2gray(xOut);
    Out=xOut;
    
    k(c)=mean(Out,'all'); %store scalar
    
    CC = bwconncomp(Out);%find connected components
    N=CC.NumObjects;% Find number count

    %Read Rows and Columns of the Image
    [rows columns]=size(Out);
    %Convert xor to Binary Image (binarize)
    for i=1:rows
        for j=1:columns
            if Out(i,j) >k(c)+N*5 %usually 0 ; 20best
            BinaryImage(i,j)=1;
            else
            BinaryImage(i,j)=0;
            end %end i
        end %end j
    end%end binary convert

    %Apply Median filter to remove Noise with m X n window
    n=round(k(c));
    if n<1 %no zero window
        n=1;
    end
    m=n;
    FilteredImage=medfilt2(BinaryImage,[m n]); %change MxN to kill noise
    %median filtering takes a NxM kernel of values, sorts kernel into 1D 
    %array of numbers, and exchanges middle value of sorted array with
    %center of kernel.

        %Out=A3; %original
        %Out=A; %enhanced
        %Out=xOut; %xor
        %Out=BinaryImage; %check result if too noisy, change xor threshold
        Out=FilteredImage; %if too noisy, change xor threshold
        
    else
        Out=A;
    end%end if after first frame

%% end function
writeVideo(v,Out); %write (stream,frame)
end %end frameseek

close(v); %close stream
implay(fname);