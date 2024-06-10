function [Se,Ee,DDPe,AUCe,u,Sp,Ep,TVP,TFP,rete1,retp,rete]= pruval(data_p,data_v,ap,av,p,m)

r_data=rectificar(data_p);

%Quinto paso Filtro de medias moviles ventana de p ms
fm_data=mediasmovil(r_data,p);
   

VP(100)=0;
FP(100)=0;
VN(100)=0;
FN(100)=0;
ST(100)=0;
ET(100)=0;

rete(100)=0;
% tdgee(100)=0;
j=1;
m1=m;
for i=0.01:0.02:2
dec=detector2roc(fm_data,i,m1);
% Clasificar por musculo ta  y ge  
[Vp,Vn,Fp,Fn,ret]=clasificar2(dec,ap,p);
ST(j)=sensibilidad(Vp,Vn,Fp,Fn);
ET(j)=especifidad(Vp,Vn,Fp,Fn);
VP(j)=Vp;
FP(j)=Fp;
VN(j)=Vn;
FN(j)=Fn;
rete(j)=ret;
j=j+1;
end
TVP=ST;
TFP=1-ET;
AUCe=abs(sum((TVP(1,2:length(ST))+TVP(1,1:length(ST)-1)).*(TFP(1,2:length(ST))-TFP(1,1:length(ST)-1))/2));
DDP=sqrt((1-TVP).*(1-TVP)+(TFP.*TFP));
DDPe=min(DDP);  
u=(find(DDP==DDPe)*0.02)-0.01;
Se=TVP(find(DDP==DDPe));
Ee=1-TFP(find(DDP==DDPe));
rete1=rete(find(DDP==DDPe));

%% prueba
r_data=rectificar(data_v);
fm_data=mediasmovil(r_data,p);
dec=detector2roc(fm_data,u,m1);
[Vp,Vn,Fp,Fn,ret]=clasificar2(dec,av,p);
Sp=sensibilidad(Vp,Vn,Fp,Fn);
Ep=especifidad(Vp,Vn,Fp,Fn);
retp=ret;
end

