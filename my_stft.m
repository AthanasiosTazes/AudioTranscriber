function [stft f xfig] = my_stft(x,wlen,h,nfft,fs)
    %Inputs
    %x - signal
    %wlen - length of fft transform
    %nfft - number of fft points
    %h - hop size
    %fs - samping frequencey
    %Outputs
    %stft - array with ffts of wlens on columns
    %frequency vector
    %performs short time fourier transform, on windows of
    %wlen length and h hop size.
    
    if size(x, 2) > 1
        x = x';
    end
    
    if rem(length(x),wlen) ~= 0                 %size of x integer multiple
        x = x(1:end  - rem(length(x),wlen));     %of wlen
    end
    xfig = x;
    
    xlen = length(x);   %length of signal
    win = hamming(wlen, 'periodic'); %emphasizing on the center samples since
                                     %there is overlap of samples on
                                     %consecutive transforms                               
    
    rown = ceil((1+nfft)/2);         %number of rows       
    coln = 1+((xlen-wlen)/h); 
%     coln = (2*xlen-256)/256
    stft = zeros(rown, coln);        %stft matrix      
    
    %me 4096 diathrw kai ta conjugate points,
    %anagkaio gia to TSS mono
    %rown = 4096;   
    
    %perform STFT
    indx = 0;
    col = 1;

    while indx + wlen <= xlen
        xw = x(indx+1:indx+wlen).*win; %sample to be transformed
        X = fft(xw, nfft);             %performing fft
        stft(:, col) = X(1:rown);      %updating stft
        %krataei mono tin mia apo ta conjugates
        %rown
        indx = indx + h;
        col = col + 1;
    end
    
    %correction of the DC & Nyquist component
    if rem(nfft, 2)                     % odd nfft excludes Nyquist point
        stft(2:end, :) = stft(2:end, :).*2;
    else                                % even nfft includes Nyquist point
        stft(2:end-1, :) = stft(2:end-1, :).*2;
    end
       
    f = ((0:rown-1)*fs/nfft)';
end