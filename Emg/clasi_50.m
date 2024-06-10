% Script que realiza el preprocesamiento de los datos y aplica el método de
% detección diseñado y exporta los resultados a excel
clear all, close all
% Carga de datos
load annotation_total
g1=load('p1.mat');
s1=load ('p3.mat');
m1=load ('p2.mat');
ge1=load('p5.mat');
gi1=load('p4.mat');
ddg=g1.data(:,:);
ddm=m1.data(:,:);
ddge=ge1.data(:,:);
ddgi=gi1.data(:,:);
dds=s1.data(:,:);

%Primer de procesamiento filtro Notch de 60Hz
gn=fnotch(ddg);
mn=fnotch(ddm);
sn=fnotch(dds);
gen=fnotch(ddge);
gin=fnotch(ddgi);


%Segundo paso de Procesamiento filtrado 50 a 500 Hz
gf=filtrado(gn);
mf=filtrado(mn);
sf=filtrado(sn);
gif=filtrado(gin);
gef=filtrado(gen);

%Tercer paso de Procesamiento Normalizar 
p1=normalizar(gf);
p2=normalizar(mf);
p3=normalizar(sf);
p4=normalizar(gif);
p5=normalizar(gef);

% Los datos se agrupan en dos set uno de prueba y otro de validación, esta
% clasificación se realiza a 10 conjuntos de datos aleatorios
% La función pruval aplica el detector a la data de prueba 
% primer set de datos p=50ms 
p=50;
n_data_p=[p2;p1;p3];
n_data_v=[p4;p5];
ap=[ap2;ap1;ap3];
av=[ap4;ap5];
[Seta1,Eeta1,DDPeta1,AUCeta1,uta1,Spta1,Epta1,TVPta1,TFPta1,reteta1,retpta1,retrocta1]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege1,Eege1,DDPege1,AUCege1,uge1,Spge1,Epge1,TVPge1,TFPge1,retege1,retpge1,retrocge1]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);
%segundo set de datos
n_data_p=[p2;p1;p5];
n_data_v=[p3;p4];
ap=[ap2;ap1;ap5];
av=[ap3;ap4];
[Seta2,Eeta2,DDPeta2,AUCeta2,uta2,Spta2,Epta2,TVPta2,TFPta2,reteta2,retpta2,retrocta2]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege2,Eege2,DDPege2,AUCege2,uge2,Spge2,Epge2,TVPge2,TFPge2,retege2,retpge2,retrocge2]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);
% tercer set de datos
n_data_p=[p1;p3;p5];
n_data_v=[p2;p4];
ap=[ap1;ap3;ap5];
av=[ap2;ap4];
[Seta3,Eeta3,DDPeta3,AUCeta3,uta3,Spta3,Epta3,TVPta3,TFPta3,reteta3,retpta3,retrocta3]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege3,Eege3,DDPege3,AUCege3,uge3,Spge3,Epge3,TVPge3,TFPge3,retege3,retpge3,retrocge3]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);
%cuarto set de datos
n_data_p=[p2;p3;p4];
n_data_v=[p1;p5];
ap=[ap2;ap3;ap4];
av=[ap1;ap5];
[Seta4,Eeta4,DDPeta4,AUCeta4,uta4,Spta4,Epta4,TVPta4,TFPta4,reteta4,retpta4,retrocta4]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege4,Eege4,DDPege4,AUCege4,uge4,Spge4,Epge4,TVPge4,TFPge4,retege4,retpge4,retrocge4]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);
%quinto set de datos
n_data_p=[p2;p3;p5];
n_data_v=[p1;p4];
ap=[ap2;ap3;ap5];
av=[ap1;ap4];
[Seta5,Eeta5,DDPeta5,AUCeta5,uta5,Spta5,Epta5,TVPta5,TFPta5,reteta5,retpta5,retrocta5]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege5,Eege5,DDPege5,AUCege5,uge5,Spge5,Epge5,TVPge5,TFPge5,retege5,retpge5,retrocge5]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);
% sexto set de datos
n_data_p=[p3;p4;p5];
n_data_v=[p2;p1];
ap=[ap3;ap4;ap5];
av=[ap2;ap1];
[Seta6,Eeta6,DDPeta6,AUCeta6,uta6,Spta6,Epta6,TVPta6,TFPta6,reteta6,retpta6,retrocta6]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege6,Eege6,DDPege6,AUCege6,uge6,Spge6,Epge6,TVPge6,TFPge6,retege6,retpge6,retrocge6]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);

%septimo set de datos
n_data_p=[p2;p4;p5];
n_data_v=[p1;p3];
ap=[ap2;ap4;ap5];
av=[ap1;ap3];
[Seta7,Eeta7,DDPeta7,AUCeta7,uta7,Spta7,Epta7,TVPta7,TFPta7,reteta7,retpta7,retrocta7]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege7,Eege7,DDPege7,AUCege7,uge7,Spge7,Epge7,TVPge7,TFPge7,retege7,retpge7,retrocge7]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);

% octavo set de datos
n_data_p=[p2;p1;p4];
n_data_v=[p3;p5];
ap=[ap2;ap1;ap4];
av=[ap3;ap5];
[Seta8,Eeta8,DDPeta8,AUCeta8,uta8,Spta8,Epta8,TVPta8,TFPta8,reteta8,retpta8,retrocta8]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege8,Eege8,DDPege8,AUCege8,uge8,Spge8,Epge8,TVPge8,TFPge8,retege8,retpge8,retrocge8]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);

%noveno set de datos
n_data_p=[p1;p3;p4];
n_data_v=[p2;p5];
ap=[ap1;ap3;ap4];
av=[ap2;ap5];
[Seta9,Eeta9,DDPeta9,AUCeta9,uta9,Spta9,Epta9,TVPta9,TFPta9,reteta9,retpta9,retrocta9]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege9,Eege9,DDPege9,AUCege9,uge9,Spge9,Epge9,TVPge9,FPge9,retege9,retpge9,retrocge9]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);

%decimo set de datos
n_data_p=[p1;p4;p5];
n_data_v=[p2;p3];
ap=[ap1;ap4;ap5];
av=[ap2;ap3];
[Seta10,Eeta10,DDPeta10,AUCeta10,uta10,Spta10,Epta10,TVPta10,TFPta10,reteta10,retpta10,retrocta10]=pruval(n_data_p(:,1),n_data_v(:,1),ap(:,1),av(:,1),p,0.35);
[Sege10,Eege10,DDPege10,AUCege10,uge10,Spge10,Epge10,TVPge10,TFPge10,retege10,retpge10,retrocge10]=pruval(n_data_p(:,2),n_data_v(:,2),ap(:,2),av(:,2),p,0.38);


reteta=[reteta1 reteta2 reteta3 reteta4 reteta5 reteta6 reteta7 reteta8 reteta9 reteta10];
retetaopt=mean(reteta);
retetastd=std(reteta);

retpta=[retpta1 retpta2 retpta3 retpta4 retpta5 retpta6 retpta7 retpta8 retpta9 retpta10];
retptaopt=mean(retpta);
retptastd=std(retpta);

retege=[retege1 retege2 retege3 retege4 retege5 retege6 retege7 retege8 retege9 retege10];
retegeopt=mean(retege);
retegestd=std(retege);

retpge=[retpge1 retpge2 retpge3 retpge4 retpge5 retpge6 retpge7 retpge8 retpge9 retpge10];
retpgeopt=mean(retpge);
retpgestd=std(retpge);


uta=[uta1 uta2 uta3 uta4 uta5 uta6 uta7 uta8 uta9 uta10];
uoptta=mean(uta);
uopttastd=std(uta);

uge=[uge1 uge2 uge3 uge4 uge5 uge6 uge7 uge8 uge9 uge10];
uoptge=mean(uge);
uoptgestd=std(uge);

Setta=[Seta1 Seta2 Seta3 Seta4 Seta5 Seta6 Seta7 Seta8 Seta9 Seta10];
Seoptta=mean(Setta);
Seoptstdta=std(Setta);

Eetta=[Eeta1 Eeta2 Eeta3 Eeta4 Eeta5 Eeta6 Eeta7 Eeta8 Eeta9 Eeta10];
Eeoptta=mean(Eetta);
Eeoptstdta=std(Eetta);

DDPetta=[DDPeta1 DDPeta2 DDPeta3 DDPeta4 DDPeta5 DDPeta6 DDPeta7 DDPeta8 DDPeta9 DDPeta10];
DDPeoptta=mean(DDPetta);
DDPeoptstdta=std(DDPetta);

AUCetta=[AUCeta1 AUCeta2 AUCeta3 AUCeta4 AUCeta5 AUCeta6 AUCeta7 AUCeta8 AUCeta9 AUCeta10];
AUCoptta=mean(AUCetta);
AUCstdta=std(AUCetta);

Sptta=[Spta1 Spta2 Spta3 Spta4 Spta5 Spta6 Spta7 Spta8 Spta9 Spta10];
Spoptta=mean(Sptta);
Spoptstdta=std(Sptta);

Eptta=[Epta1 Epta2 Epta3 Epta4 Epta5 Epta6 Epta7 Epta8 Epta9 Epta10];
Epoptta=mean(Eptta);
Epoptstdta=std(Eptta);

%ge

Setge=[Sege1 Sege2 Sege3 Sege4 Sege5 Sege6 Sege7 Sege8 Sege9 Sege10];
Seoptge=mean(Setge);
Seoptstdge=std(Setge);

Eetge=[Eege1 Eege2 Eege3 Eege4 Eege5 Eege6 Eege7 Eege8 Eege9 Eege10];
Eeoptge=mean(Eetge);
Eeoptstdge=std(Eetge);

DDPetge=[DDPege1 DDPege2 DDPege3 DDPege4 DDPege5 DDPege6 DDPege7 DDPege8 DDPege9 DDPege10];
DDPeoptge=mean(DDPetge);
DDPeoptstdge=std(DDPetge);

AUCetge=[AUCege1 AUCege2 AUCege3 AUCege4 AUCege5 AUCege6 AUCege7 AUCege8 AUCege9 AUCege10];
AUCoptge=mean(AUCetge);
AUCstdge=std(AUCetge);

Sptge=[Spge1 Spge2 Spge3 Spge4 Spge5 Spge6 Spge7 Spge8 Spge9 Spge10];
Spoptge=mean(Sptge);
Spoptstdge=std(Sptge);

Eptge=[Epge1 Epge2 Epge3 Epge4 Epge5 Epge6 Epge7 Epge8 Epge9 Epge10];
Epoptge=mean(Eptge);
Epoptstdge=std(Eptge);

% figure;
% boxplot(uta);
% figure;
% boxplot(uge);

%exportando a excel
%Obtener el Path de la carpeta Actual
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/retardos_training_test_50ms.xls'];
%datos a excel
titulo = {'rete_ta_uopt' 'rete_ge_uopt' 'retp_ta' 'retp_ge'};
datos =  vertcat(reteta,retpta,retege,retpge)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');

%p es para las 10 pruebas, y e es la evaluacion
%exportando a excel
%Obtener el Path de la carpeta Actual
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/retardos_training_test_50ms_prom.xls'];
%datos a excel
titulo = {'retta_prom_e' 'retta_std_e' 'retge_prom_p' 'retge_std_p' 'retta_prom_p' 'retta_std_p' 'retge_prom_p' 'retge_std_p'};
datos =  vertcat(retetaopt,retetastd,retegeopt,retegestd,retptaopt,retptastd,retpgeopt,retpgestd)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');

%exportando a excel
%Obtener el Path de la carpeta Actual
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/detector_ta_50ms.xls'];
%datos a excel
titulo = {'SEN(ent)' 'ESP(ent)' 'DDP(ent)' 'AUC(ent)' 'UMB(opt)' 'SEN(pru)' 'ESP(pru)'};
datos =  vertcat(Setta,Eetta,DDPetta,AUCetta,uta,Sptta,Eptta)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');
 
 [stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/detector_ge_50ms.xls'];
%datos a excel
titulo = {'SEN(ent)' 'ESP(ent)' 'DDP(ent)' 'AUC(ent)' 'UMB(opt)' 'SEN(pru)' 'ESP(pru)'};
datos =  vertcat(Setge,Eetge,DDPetge,AUCetge,uge,Sptge,Eptge)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');
 
 
  [stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/promedios_50ms.xls'];
%datos a excel
titulo = {'SEN(ent)ta' 'ESP(ent)ta' 'DDP(ent)ta' 'AUC(ent)ta' 'UMB(opt)ta' 'SEN(pru)ta' 'ESP(pru)ta'...
    'SEN(ent)ge' 'ESP(ent)ge' 'DDP(ent)ge' 'AUC(ent)ge' 'UMB(opt)ge' 'SEN(pru)ge' 'ESP(pru)ge'};
datos =  vertcat(Seoptta,Eeoptta,DDPeoptta,AUCoptta,uoptta,Spoptta,Epoptta,...
    Seoptge,Eeoptge,DDPeoptge,AUCoptge,uoptge,Spoptge,Epoptge)';
datosstd=vertcat(Seoptstdta,Eeoptstdta,DDPeoptstdta,AUCstdta,uopttastd,Spoptstdta,Epoptstdta,...
    Seoptstdge,Eeoptstdge,DDPeoptstdge,AUCstdge,uoptgestd,Spoptstdge,Epoptstdge)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');
  xlswrite(Nameexcel, datosstd, 1, 'A3');
 
%detector toda la data 
%ta
n_data=[p1;p2;p3;p4;p5];
a=[ap1;ap2;ap3;ap4;ap5];
r_data=rectificar(n_data(:,1));
fm_data=mediasmovil(r_data,p);
dec=detector2roc(fm_data,0.988,0.35);
[Vp,Vn,Fp,Fn,retta]=clasificar2(dec,a(:,1),p);
Spta=sensibilidad(Vp,Vn,Fp,Fn);
Epta=especifidad(Vp,Vn,Fp,Fn);
DDPpta=sqrt((1-Spta)*(1-Spta)+((1-Epta)*(1-Epta)));
%ge
n_data=[p1;p2;p3;p4;p5];
a=[ap1;ap2;ap3;ap4;ap5];
r_data=rectificar(n_data(:,2));
fm_data=mediasmovil(r_data,p);
dec=detector2roc(fm_data,uoptge,0.38);
[Vp,Vn,Fp,Fn,retge]=clasificar2(dec,a(:,2),p);
Spge=sensibilidad(Vp,Vn,Fp,Fn);
Epge=especifidad(Vp,Vn,Fp,Fn);
DDPpge=sqrt((1-Spge)*(1-Spge)+((1-Epge)*(1-Epge)));
%exportando a excel
%Obtener el Path de la carpeta Actual
[stat,struc] = fileattrib;
PathCurrent = struc.Name;
%crear las rutas (Path) para carpetas y archivos
FolderName = ['excel'];
PathFolder = [PathCurrent];
NameFile = [PathFolder '/readme.txt'];
Nameexcel = [PathFolder '/detector_uopt_50ms.xls'];
%datos a excel
titulo = {'UOPT(ta)' 'SEN(taopt)' 'ESP(taopt)' 'DDP(taopt)' 'Retardo(ta)' 'UOPT(ge)' 'SEN(geopt)' 'ESP(geopt)' 'DDP(geopt)' 'Retardo(ge)'};
datos =  vertcat(uoptta,Spta,Epta,DDPpta,retta,uoptge,Spge,Epge,DDPpge,retge)';
 xlswrite(Nameexcel, titulo, 1, 'A1');
 xlswrite(Nameexcel, datos, 1, 'A2');