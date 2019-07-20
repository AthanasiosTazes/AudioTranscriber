clear all;
close all;
clc;
tic
%------------------------initialization------------------------------------
[x, fs] = audioread('C:\Users\thano\Desktop\kathara\Final\Tazes\fewbabas.wav');
%[x, fs] = audioread('/home/atazes/Desktop/asdip/Final/Tazes/those.m4a');
x = x(:, 1);                                                               %picking channel arbitrarily

[xmax,xmaxl] = max(abs(x));                                                %normalisation
x(xmaxl) = xmax;                   
x = x/xmax;
xb = x;                                                                    %back up signal

%------------------------Preproccessing------------------------------------
%Equaliser
cutoff = 70;                                                               %2-Highpass 
x = my_equalizer(x,fs,cutoff,2);                                           %signal for onsets   
cutoff = 10000;                                                            %1-Lowpass                                     
xx  = my_equalizer(x, fs, cutoff, 1);                                      %signal for pitch 
clear('cutoff');

%Stft
wlen = 256;                                                                %window length
h = wlen/2;                                                                %hop size 
nfft = 4096;                                                               %number of fft points 
[stft, f, xfig] = my_stft(x, wlen, h, nfft, fs);                           %xfig figure for plots (x256)
xx = xx(1:length(xfig));                                                   %x256 for pitch

%------------------------Onsets Detection---------------------------------- 
%Detection Function
[detection Gk Gk_sum Rk Rk_t] = onset_detection(stft,f);                           %detection function in frames

%Peak Picking
[onsets_function Sn Mf]= peak_pick(detection,0.14,30,5,6);               %onsets picked in frames                                                   

%Frames to sampes
[onsets, onsets_frames, onsets_values, onsets_samples] = fts(onsets_function,length(xfig));


%------------------------Pitch Detection-----------------------------------
%Fundamental Frequency
[notes_f R] = pitch_detection(onsets,xx);%xx

%Translator
match = translator(notes_f);
% 
% %Pitch Refinement
[notes res1 PS] = pitch_refinement(match,onsets_samples,xx);%xx

%----------------------------Results---------------------------------------
result = results(notes,onsets_samples,fs);

figure;
subplot(2,1,1);
plot(xfig);
title('Guitar Signal')
hold on
plot(onsets,'r')

subplot(2,1,2)
plot(onsets)
toc
