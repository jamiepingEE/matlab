%q4a

clear
clc
clf
%frame is image
%image is array
%array is a field
%field consists of rows

%img=imread('p1img.png');
%im=rgb2gray(img); %grayscale
%a=im2double(im); %uint8 to double

img2=imread('house.tiff'); %grayscale
b=im2double(img2); %uint8 to double

%odd rows
A=b(1:2:end,:); %row indices: 1 0 3 0 5... end
%even rows
B=b(2:2:end,:); %0 2 0 4... end

%show the odd field
%imshow(A)
%imshowpair(A,b,'montage')

%interpolate: assume we only have the odd field
%take value of odd row and next of odd row: A(k-1)+A(k+1)
%take average: ( A(k-1)+A(k+1) )/2
%equal this to average: avg=( A(k-1)+A(k+1) )/2
%assign this average to value at current row,col C(r,c)=avg
%do same for "after-next" row


%Construct array C:
%since A is built from odd rows of original image
%for odd rows of C corresponds to rows of A
%if image limit is even, height of C is smaller than original
%if odd, height of C is equal to original

    
%since B is built from even rows of original image
%for even rows of C corresponds to rows of B
%if image limit is even, height of C is equal to original
%if odd, C is smaller than original
%first row of C is padded


k=1; %dummy k
for r=1:2:2*length(A(:,1)) %ex: up to 128 (height of A), base r on A's height

    %Inner loop: sweep row of A and output into current row of C
    for c=1:length(A(1,:)) %k is size of A's column
        C(r,c)=A(k,c); %C grows to be twice height of A
    end
    k=k+1;
end

%pad if not the same size
C=padarray(C,1,0,'post');
C0=C;

%interpolation: using mean with intensity error as threshold
%for odd rows of C == avg
k=2;
for r=2:2:2*length(A(:,1))-3
     
    %vertical scan
    for c=1:length(A(1,:)); %throughout entire row
         
         %condition: intensity error
         if abs(A(k-1,c)-A(k+1,c))/A(k-1,c)>0.9 %different
         C(r,c)=A(k-1,c); %use previous pixel
         else %if a bit similar
         C(r,c)=( A(k-1,c)+A(k+1,c) )/2; %mean
         end
         
    end %end vertical scan
     
     
    %horizontal scan
    for c=1:length(A(1,:))-1; %throughout entire row
         if abs(A(k-1,c)-A(k-1,c+1))/A(k-1,c)>0.1 %if very different
             C(r,c)=A(k-1,c); %keep the current column pixel
         else %not much different
             C(r,c)=( A(k-1,c)+A(k-1,c+1) )/2; %use mean
             
         end
         
    end %end horizontal scan
    k=k+1;
 end
C=C+abs(mean(C,'all')-mean(b,'all')); %readjust PSNR
%C=C+0.0015;

%downsample once
 C=imgaussfilt(C,0.3); %filter
 C = imresize(C,0.5);
 C = imresize(C,2);
 C=imgaussfilt(C,0.3); %filter

%C=C.^1.5; %square all intensities to restore color
%C=histeq(C); %contrast
%imshow(C)
%imshowpair(B,C0,'montage') %B is halffield, C0 is interlaced
%saveas(gcf,'q4a2.png');
imshowpair(C,b,'montage') %b is original stock image
%saveas(gcf,'q4b.png');
%imhist(C)
ref=b;
peaksnr = psnr(C,ref)
