function [det Sn Mf] = peak_pick(detection,thr,safe,mf,reg_win)
    %Inputs
    %detection - the detection function
    %thr - a soft threshold to apply to it
    %safe - the distnace between acceptable attack when many spotted
    %mf - the length of soft medfiltering
    %reg_win - the length of linear regression performed on detection
    %Outputs
    %det - the picked values for onsets
    %Sn the slope of detection function
    %This function picks the peaks as final onsets. It first performs a
    %soft medfiltering to smooth the small peaks corresponding to some
    %potential fake onsets, and then uses the slope of the function instead
    %of it to augment to peaks. Picks the strongest one if many are spotted
    %at close temporal positions.

    %Median filtering
    temp = medfilt1(detection,mf);           %soft medfilt
    Mf = temp;
    
    %---------Slope detection and aplification of detection function-------
    Sn = zeros(length(detection),1);    %slopes of linear regression
    Os = zeros(length(detection),1);    %offsets of linear regression

    ampenv = abs(hilbert(temp));   %amplitude envelop
    ampenv = ampenv./max(ampenv);       %normalize
%     ampenv = detection;

    %Linear regression of each node for 7 points ahead of the node
    for i = 1:length(ampenv)-reg_win
        [slope offset] = my_ls(linspace(i,i+reg_win-1,reg_win)',ampenv(i:i+reg_win-1),reg_win);
        Sn(i) = slope;
        Os(i) = offset;
    end
    Sn = Sn/max(Sn);
    Sn(Sn<0) = 0;
    
    %Cutoff of extremely variant samples
    [NN XX] = hist(Sn,100);
    for i = 100:-1:1
        if NN(i) > 2
            ind = i;
            break;
        end
    end
    Sn(Sn>XX(ind)) = 0;
    Sn = Sn/max(abs(Sn));
    
    %-------------------Threshold-------------------------------------
    det = Sn;
    det(det<thr) = 0;

    %keeping highest value among close ones of safe distance
    index = 0;
    for i = safe/2 + 1:length(det)-safe/2 -1      %evala to 16
        if det(i) ~= 0;
            temp = det(i);
            for j = i-safe/2:i+safe/2            %for j = i:i+safe
                if det(j) > temp
                    temp = det(j);
                    index = j;
                end
            end
            if index ~= 0
                det(i:i+safe) = 0;
                det(index) = temp;
            end
        end
    end
end