   function [ x] =normalizar(data)
   media1=mean(data(:,1));
   media2=mean(data(:,2));
   des1=std(data(:,1));
   des2=std(data(:,2));
   data1=((data(:,1))-media1)./des1;
   data2=((data(:,2))-media2)./des2;
   x=[data1 data2];
end

