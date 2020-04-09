% Project 1
% Course  : Bioinstrumentation
% Summary : To find the fourier transform of the data and compare the
%          frequecies when delta t is increased using graph.
clc;
clear all;
close all;


% According to sampling theorem The nyquist rate is 2*Fmax
% where Fmax is maximum frequency in the whole signal, i.e. 4 here both in
% y1 & y2

% therefore sampling frequency will be = 2x4=8 and t(delta_t here) should be <=1/8. 

% In first part delta_t should be 3 times smaller therefore t=1/24


t=0:1/24:2*pi; % i have taken range of t from  0 to 2*pi at 1/24 time intervals

y1 = 2*sin(2*pi*1*t) + 4*sin(2*pi*2*t) + 3*sin(2*pi*4*t);
y2 = 2*cos(2*pi*1*t) + 4*cos(2*pi*2*t) + 3*cos(2*pi*4*t);

figure;
plot(t,y1)
figure;
plot(t,y2)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% After increasing delta t %

t=0:1/8:2*pi; 

y1 = 2*sin(2*pi*1*t) + 4*sin(2*pi*2*t) + 3*sin(2*pi*4*t);
y2 = 2*cos(2*pi*1*t) + 4*cos(2*pi*2*t) + 3*cos(2*pi*4*t);

figure;
plot(t,y1)
figure;
plot(t,y2)

%%%  DIFFERENCE ANALYSIS IN GRAPHS  %%%
% 1. After increasing step size the no. of cycles in y1 is reduced.
% 2. Shape of the graph of y2 is a little changed

% Now again when t=1/24 %
% calculating fft of y1 and y2 %

t=0:1/24:2*pi;
y1 = 2*sin(2*pi*1*t) + 4*sin(2*pi*2*t) + 3*sin(2*pi*4*t);
y2 = 2*cos(2*pi*1*t) + 4*cos(2*pi*2*t) + 3*cos(2*pi*4*t);

L1=length(y1);
L2=length(y2);

Fs=1/24;

Nfft=2^nextpow2(L1); % Next power of 2 from length of y1 or y2
X1=fft(y1,Nfft);     %compute DFT using FFT
X2=fft(y2,Nfft);

fVa=Fs*(-Nfft/2:Nfft/2-1)/Nfft;

% For y1 %
figure;
plot(fVa,abs(X1),'b');	
title('Double Sided FFT of y1 ');	 	 
xlabel('Frequency(Hz)')		 
ylabel('|DFT Values|');
figure;
plot(fVa,unwrap(angle(X1)));
title('Phase plot ');	 	 
xlabel('Frequency (Hz)')		 
ylabel('Phase');

%For y2 %
figure;
plot(fVa,abs(X2),'b');	
title('Double Sided FFT of y2 ');	 	 
xlabel('Frequency(Hz)')		 
ylabel('|DFT Values|');
figure;
plot(fVa,unwrap(angle(X2)));
title('Phase plot ');	 	 
xlabel('Frequency (Hz)')		 
ylabel('Phase');
