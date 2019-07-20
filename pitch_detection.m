function [notes R] = pitch_detection(onsets,x)
    %Inputs
    %onsets - detection function in samples
    %x - signal to check for notes
    %Outputs
    %notes - frequency of each onset note, the 3 strongest potential
    %This function performs ACF to find the 3 strongest frequencies present
    %in the signal, which we will later try to establish with is the
    %strongest

    vec = find(onsets);
    sam = 4410;
    notes = zeros(length(vec),3);

    for i = 1:length(vec)
        if vec(i) + sam > length(x)
            temp = x(vec(i):end)
        else
            temp = x(vec(i):vec(i) + sam); 
        end
        
        [tv ti] = max(abs(temp));        
        temp(ti) = tv;                   
        temp = temp/ti;
        len = length(temp);

        %perform acf
        nfft = 2^nextpow2(2*len-1); %16384
        nfft = 8820;
        r = ifft( fft(temp,nfft) .* conj(fft(temp,nfft)) );
%         R=r;
        %# rearrange and keep values corresponding to lags: -(len-1):+(len-1)
        r2 = r(1:size(r)/4);
        r2(1:40) = 0;
        
        R(:,i) = r2;
 
        %finding 3 strongest, non subharmonic frequencies
        for j = 1:3
            [mv mi] = max(r2);
            while (44100/mi)<80
                r2(mi-10:mi+10) = 0;
                [mv mi] = max(r2);
            end
            notes(i,j) = 44100/mi;
            r2(mi-10:mi+10) = 0;
        end     
    end
end
