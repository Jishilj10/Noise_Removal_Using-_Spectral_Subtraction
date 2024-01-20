clear all
clc
close all

[s,fs]=audioread('Csound.wav');


%%
%Initial signal
figure
S=fftshift(abs(fft(s)));
n=linspace(-fs/2,fs/2,length(S));
stem(n,S)
title("Original Signal Spectrum");
grid on

%%
%Noise signal used
[n1,fsn]=audioread('Cnoise1.wav');

figure
N1=fftshift(abs(fft(n1)));
nnoi=linspace(-fsn/2,fsn/2,length(N1));
stem(nnoi,N1);
title("Noise Signal Spectrum");
grid on

%%
%Noise removal 
%Done using spectral subtraction method 
%Noise signal is recorded seperately and split into frames.
p=max(n1);
l=length(s);
for i=1:l
    if (s(i)<=p  && s(i)>=-p)
        s(i)=0;
    end
end
[vs,n]=createFrames(s,256,1024); % Creating noisy signal frames 
[vn,nn]=createFrames(n1,256,1024);% Creating noise signal frames
p=floor(length(s)/256);
d=zeros(1,1024);
for i=1:p
   d= d + abs(fft(vn(i,:)));        
end
u=d./p;
for i=1:p
    ws(i,:)=fft(vs(i,:))- 0.2*u;
    wst(i,:)=ifft(ws(i,:));
end
s2=fusionFrames(wst, 256);
h=fir1(150,0.7);
s1=filter(h,1,s2);

%%
%Frquency shaper 

S1=fft(s1);
x=length(s1);
hi=ones(x/2,1);
hi(6283:15707)=20;              % 1000 Hz - 2500Hz
h=cat(1,flipud(hi),hi);
figure
k=linspace(-fs/2,fs/2,length(h));
plot(k,h);
title("Window for frequency shaping")
grid on
S2=fftshift(S1).*h;% Multiplication with frequency shaping window
s2=ifft(fftshift(S2));


%%
%Amplitude shaper
S2=fft(s2);
p=max(S2);
pdb=20*log10(p);
if (pdb>100)
    g=pdb-100;
    S3=S2- 10^(g/20);
elseif (pdb<40)
    g=40-pdb;
    S3 = S2 + 10^(g/20);
else
    S3=S2;
end
s3=ifft(S3);

%%
%Final signal obtained
figure
S3=fftshift(abs(fft(s3)));
n3=linspace(-fs/2,fs/2,length(S3));
stem(n3,S3); 
title("Final Signal Spectrum");
grid on

%%
%Files creator
audiowrite('original audio.wav',s,fs);
audiowrite('Final processed signal.wav',real(s3),fs);


