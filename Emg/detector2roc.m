function [d]=detector2roc(r,u,m)
    d=ones(length(r),1)*0;
for i=1:length(r)
    if(r(i)>m*u) 
        d(i)=1;    
    end
 end
 
 
 end
 
