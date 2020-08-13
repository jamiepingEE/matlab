function out=FT(n,x,w)
%take in arguments (interval,input signal,angular frequency interval)

 for k=1:length(w);
 sum=0;
  for i=1:length(n);
   sum=sum+x(i)*exp(-j*w(k)*n(i));
  end
 ft(k)=sum;
 end
out=ft; %return array containing resulting fourier series
end