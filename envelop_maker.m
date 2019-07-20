function [envelop] = envelop_maker()
    %Output - envelop of power spectrum of 36 guitar notes
    %Thins function creates an envelop of power spectrum of the 36 notes
    %contained in 3 octaves, played on a classical guitar.

    samples = 4410;
    no_frets = 36;
    x = zeros(samples,no_frets);
    
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\e.wav'); 
    y = y(1:samples,:);
    x(:,1) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f.wav');
    y = y(1:samples,:);
    x(:,2) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f#.wav');
    y = y(1:samples,:);
    x(:,3) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g.wav'); 
    y = y(1:samples,:);
    x(:,4) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g#.wav'); 
    y = y(1:samples,:);
    x(:,5) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a.wav'); 
    y = y(1:samples,:);
    x(:,6) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a#.wav'); 
    y = y(1:samples,:);
    x(:,7) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\b.wav'); 
    y = y(1:samples,:);
    x(:,8) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c.wav'); 
    y = y(1:samples,:);
    x(:,9) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c#.wav'); 
    y = y(1:samples,:);
    x(:,10) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d.wav'); 
    y = y(1:samples,:);
    x(:,11) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d#.wav'); 
    y = y(1:samples,:);
    x(:,12) = y(:,1);
    
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\e2.wav'); 
    y = y(1:samples,:);
    x(:,13) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f2.wav');
    y = y(1:samples,:);
    x(:,14) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f#2.wav');
    y = y(1:samples,:);
    x(:,15) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g2.wav'); 
    y = y(1:samples,:);
    x(:,16) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g#2.wav'); 
    y = y(1:samples,:);
    x(:,17) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a2.wav'); 
    y = y(1:samples,:);
    x(:,18) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a#2.wav'); 
    y = y(1:samples,:);
    x(:,19) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\b2.wav'); 
    y = y(1:samples,:);
    x(:,20) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c2.wav'); 
    y = y(1:samples,:);
    x(:,21) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c#2.wav'); 
    y = y(1:samples,:);
    x(:,22) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d2.wav'); 
    y = y(1:samples,:);
    x(:,23) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d#2.wav'); 
    y = y(1:samples,:);
    x(:,24) = y(:,1);
    
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\e3.wav'); 
    y = y(1:samples,:);
    x(:,25) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f3.wav');
    y = y(1:samples,:);
    x(:,26) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\f#3.wav');
    y = y(1:samples,:);
    x(:,27) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g3.wav'); 
    y = y(1:samples,:);
    x(:,28) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\g#3.wav'); 
    y = y(1:samples,:);
    x(:,29) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a3.wav'); 
    y = y(1:samples,:);
    x(:,30) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\a#3.wav'); 
    y = y(1:samples,:);
    x(:,31) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\b3.wav'); 
    y = y(1:samples,:);
    x(:,32) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c3.wav'); 
    y = y(1:samples,:);
    x(:,33) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\c#3.wav'); 
    y = y(1:samples,:);
    x(:,34) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d3.wav'); 
    y = y(1:samples,:);
    x(:,35) = y(:,1);
    y = audioread('C:\Users\thano\Desktop\kathara\Final\frets\d#3.wav'); 
    y = y(1:samples,:);
    x(:,36) = y(:,1);
    
    fs = 44100;
    %normalisation
    for i = 1:no_frets
        [xmax xmaxl] = max(abs(x(:,i)));        
        x(xmaxl,i) = xmax;                   
        x(:,i) = x(:,i)/xmax;
                                                                        
        x(:,i) = my_equalizer(x(:,i),fs,70,2);  
        x(:,i) = my_equalizer(x(:,i),fs,10000,1); 
        
        [xmax xmaxl] = max(abs(x(:,i)));        
        x(xmaxl,i) = xmax;                   
        x(:,i) = x(:,i)/xmax;
    end
    
    nfft = 4096*4;
    PS = zeros(nfft/2,no_frets);
    
    %Fft of notes
    for i = 1:no_frets
        Y = fft(x(:,i),nfft);
        Y = abs(Y);%.^2;
        Y = Y(1:end/2);
        PS(:,i) = Y;
    end
    
    %Envelop
    for i = 1:no_frets
        PS(:,i) = PS(:,i)/max(PS(:,i));
    end
    
    envelop = PS;
end

    
    
    
    
