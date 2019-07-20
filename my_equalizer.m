function x = my_equalizer(x, fs, cutoff, func)
    %Inputs
    %x - signal to be transformed
    %fs - sampling rate
    %cutoff - cutoff frequency
    %func - 1 for highcut, 2 for lowcut
    %Outputs
    %x - reconstructed signal withouth cutoff frequencies
    %Performs lowpass or highpass of the input signal. Regardless which
    %operation is performed, it will also perform removal of extremely
    %variant values of the resulting signal through histogram.

    N = length(x);          
    Nfft = 2^nextpow2(N);
    f = fs/2*linspace(0,1,1+Nfft/2);    %freqs vector
    
    y1 = fft(x,Nfft);                   %perform fft transform
    ylen = length(y1);                  %length of transformed
    
    if func == 1
        ind = find(f<=cutoff);          %ind - indexes of f not to be cut
    elseif func == 2                    %lowpass/highpass function
        ind = find(f>=cutoff); 
    else
        ind = find(f);
    end
     
    y2 = zeros(ylen,1);                 %y2 - array with cutoff freqs 
    y2(ind) = y1(ind);                  %remaining freqs
    y2(1:ind-1) = 0;                    %cutoff freqs
    
    %create a conjugate symmetric vector of amplitudes
    %needed for inverse transform
    nf=length(f);
    for k=nf+1:ylen,
        y2(k) = conj(y2(mod(ylen-k+1,ylen)+1)); 
    end
    
    x = ifft(y2);            %inverse transform
    x = x(1:N);  
    
    [xmax xmaxl] = max(abs(x));      
    x(xmaxl) = xmax; 
    x = x/xmax;
    
    %Cutoff of extremely variant samples
    [NN XX] = hist(x,100);
    for i = 100:-1:1
        if NN(i) > 2
            ind2 = i;
            break;
        end
    end
    x(x>XX(ind2)) = 0;
    
    %normalisation
    [xmax xmaxl] = max(abs(x));      
    x(xmaxl) = xmax; 
    x = x/xmax;
end
