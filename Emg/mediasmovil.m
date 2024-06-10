function [d]=mediasmovil(r,p)
%ventana de 200 muestras fs=4KHz
%Ts=250 us para t=50 ms 
    paso=p*0.001;
    Ts=1/4000;
    ven=floor(paso/Ts);%tamaño de la ventana
    emg(length(r)-ven)=0;
for i=1:length(r)-ven
    emg(i)=mean(r(i:i+ven));
end

d=emg';