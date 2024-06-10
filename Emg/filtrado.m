function [f]=filtrado(data)
frec_s=4000;
frec_corte= 50;
frec_corte1= 500;
Wnl= 2*frec_corte1/frec_s;
Wnh= 2*frec_corte/frec_s;
[Bh,Ah] = butter(6,Wnh,'high');
[Bl,Al] = butter(6,Wnl,'low') ;
EMG_GLta= filtfilt(Bl,Al,data(:,1));
EMG_GHta= filtfilt(Bh,Ah,EMG_GLta);
EMG_GLge= filtfilt(Bl,Al,data(:,2));
EMG_GHge= filtfilt(Bh,Ah,EMG_GLge);
f=[EMG_GHta EMG_GHge];
end