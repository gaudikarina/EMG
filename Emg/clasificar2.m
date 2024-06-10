function [VP,VN,FP,FN,ret] =clasificar2(d,anot,p)   
    size=length(d);
    VP=0;
    FP=0;
    FN=0;
    VN=0;
    paso=p*0.001;
    Ts=1/4000;
    ven=floor(paso/Ts);
    an=anot(ven:length(anot));
    j=1;
    t(size)=0;
    for i=1:size
    if (d(i)==1 && an(i)==1)
        VP=VP+1;
        t(j)=i;
        j=j+1;
    else
        if(d(i)==1 && an(i)==0)
            FP=FP+1;
        else
            if(d(i)==0 && an(i)==1)
                FN=FN+1;
            else
                VN=VN+1;
            end
        end
    end
    end
    j=1;
    tan=find(an==1);
    tai(1)=find(an,1);
    for i=1:length(tan)-1
        ai=tan(i+1)-tan(i);
       if ai>1
           tai(j+1)=tan(i+1);
           j=j+1;
       end
    end
    td(length(tai))=0;
    for i=1:length(tai)        
        r=find(t>=tai(i));
        td(i)=t(r(1));
    end    
    rt=(td-tai)./4000;
    ret=mean(rt); 
  end




