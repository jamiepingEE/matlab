%q3a

function out=imhistdistance(A1, A2, L) %user specify L as L equal blocks(bins) of the image
%take in variables(A1,A2,L) (image1, image2, bins)
%transform A into L blocks/bins

%i)
B1= imhist(A1, L); %L is bin modifier, let L be user input
B2= imhist(A2, L);

x=B1;
y=B2;

%ii)
%if x and y are histogram bin vectors
xy   = dot(x,y);
nx   = norm(x);
ny   = norm(y);
den = nx*ny;
S   = xy/den;

%iii)
if S>0.5 %majority
    disp('Similar') %"Similar"
end

out=S
end