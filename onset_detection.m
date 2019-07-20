function [detection Gk Gk_sum Rk Rk_t] = onset_detection(stft,f)
    %Inputs
    %x - signal of onset detection
    %Outputs
    %detection - detection function
    %Thins function will create the detection function accordingly to the
    %phase and spectral components of the stft of the signal.
    
    sp = unwrap(angle(stft),[],2); %unwrapped phase
    stft_b = stft;                 %backup stft
    stft = abs(stft);              %spectral
    
    %--------------------Energy weight-------------------------------------
    freqs = linspace(1,2,size(stft,1));
    %for i =  1:size(stft,1)
    %    stft(i,:) = stft(i,:) * freqs(i);
    %end
   
    %-----------------Phase Difference Function----------------------------
    [aa bb] = size(sp);
    DF = zeros(aa,bb);                  %2nd phase differentiate
    DF1 = zeros(aa,bb);                 %phase 2
    DF2 = zeros(aa,bb);                 %phase 3
    
    DF1(:,2:end) = sp(:,1:end-1) ;
    DF2(:,3:end) = sp(:,1:end-2);
    DF = 2*DF1-DF2;
    DF = sp - 2*DF1 + DF2;
    DF = wrapToPi(DF);
    cDF = cos(DF);
    
   %-----------------Spectral Difference Function---------------------------
    Rk_t = zeros(aa,bb);                %estimated target
    Rk = zeros(aa,bb);                  %current

    Rk_t(:,2:end) = stft(:,1:end-1);
    Rk_t(:,1) = Rk_t(:,2);
    Rk = stft;
    
    for i = 1:aa               %normalize rows
        Rk(i,:) = Rk(i,:)/max(Rk(i,:)); 
        Rk_t(i,:) = Rk_t(i,:)/max(Rk_t(i,:)); 
    end

    %------------------Euclidean Distance----------------------------------
    Gk = (  ((Rk_t).^2) + ((Rk).^2) - 2*Rk_t.*Rk .* cDF ).^(1/2);   % 
    %Gk_sum = sum(Gk)';               %arxiko
    Gk_sum = sum(Gk(1:900,:))';       %san lowpass
    Gk_sum = Gk_sum/max(Gk_sum);
    
    %-------------Cutoff of extremely variant samples----------------------
    [NN XX] = hist(Gk_sum,100);
    for i = 100:-1:1
        if NN(i) > 2
            ind = i;
            break;
        end
    end
    
    Gk_sum(Gk_sum>XX(ind)) = 0;
    detection = Gk_sum;
end



      





