clear all;
clc;
Fs=8000;
recorder = audiorecorder(Fs,16,1);
recordblocking(recorder,6);
audioarray = getaudiodata(recorder);
audiowrite('Cnoise.wav',audioarray,Fs)
