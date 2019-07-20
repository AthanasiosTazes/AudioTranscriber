function [result res1] = envelop_matcher(match,onsa,PS,x)
    %Inputs
    %match - the array with the notes of the onsets
    %onsets_sampes - onsets indexed at samples
    %Ps - envelop of preplayed notes
    %x - our signal
    %Outputs
    %result - final result of note attribution
    %This function crosschecks the spectrums of the pitch_detection result
    %and uses some logic to improve the results, like octave matching etc.
    
    %-------------------Important frequency bins of notes------------------
    fs = 44100;
    nfft = 4096*4;
    f = (((0:1/(nfft/2):1-1/(nfft/2))*fs)/2)';

    A4 = 440;
    low_step = 29;            %distance from start to A4
    bas = 2^(1/12);
      
    no_freq = 83;                  %number of frequencies of interest
    f_notes = zeros(no_freq,1);    %their frequencies
    for i = 1:no_freq
        f_notes(i) = A4*bas^-low_step;
        low_step = low_step - 1;
    end
    
    notes_bins = zeros(no_freq,1);  %corresponding bins of important freqs
    p=1;
    for i = 10:length(f)-1
        if f(i-1) < f_notes(p) && f(i) > f_notes(p)
            notes_bins(p) = i;
            if p == no_freq
                i = length(f) - 1;
            else
                p = p + 1;
            end
        end
    end
    
   
    %--------------------Onsets with Envelop compare-----------------------
    result1 = zeros(length(onsa),1);
    result = zeros(length(onsa),2);
    buffer = zeros(36,1);
    
    for i = 1:length(onsa)%-22
        if onsa(i) + 4410 > length(x)
            temp = x(onsa(i):end);
        else
            temp = x(onsa(i):onsa(i)+4410);
        end
        Y = fft(temp,nfft);
        Y = abs(Y);%.^2;
        Y = Y(1:end/2);
        Y = Y/max(abs(Y));
         
          
%       NOTES BINS NORMALIZED
        for j = 1:36
            a1 = Y(notes_bins);
            a1 = a1/max(a1);
            
            a2 = PS(notes_bins,j);
            a2 = a2/max(a2);
            
            buffer(j) = sum(abs(a1 - a2));  %athroisma diaforas suxnothtwn gia mia apo tis 36 notes
        end
        [a b] = min(buffer);
        result1(i) = b - 1;
        res1 = buffer;

        
        
        %Den apodothike suxnothta
        if match(i,1) < 0
            result(i,1) = result1(i);
        
        %Apdothike mpasa suxnothta
        elseif match(i,1) >= 0 && match(i,1) <= 12
            %Sugkrish kai diathrhsh tou PS an exoun diafora 12, alios tou
            %ACF  
            if (mod(abs(result1(i) - match(i,1)),12)) == 0 || mod(abs(result1(i) - match(i,2)),12) == 0 || mod(abs(result1(i) - match(i,3)),12) == 0 
                result(i,1) = result1(i);
            else
                result(i,1) = match(i,1);
            end
           
        %Apodothike prima suxnothta pros to paron anatithete mono vash tou
        %envelop, 
        elseif result1(i) > 20  
            result(i,1) = result1(i);
        else
            result(i,1) = match(i,1);
        end
        
    end
    res1 = result1;
end
    
    
