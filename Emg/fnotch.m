function x=fnotch(data)
frec_s=4000;
frec_corte= 60;
w=frec_corte/(frec_s/2);
bw=w/35;
[b,a]=iirnotch(w,bw);
EMG_Nta= filtfilt(b,a,data(:,2));
EMG_Nge= filtfilt(b,a,data(:,3));
x=[EMG_Nta EMG_Nge];
end

