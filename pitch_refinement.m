function [notes res1 PS] = pitch_refinement(match,onsets_samples,x)
    %Inputs
    %match - the array with the notes of the onsets
    %onsets_sampes - onsets indexed at samples
    %x - our signal
    %Outputs
    %notes - final result of note attribution
    %This function creates an envelop of power spectrum of the 36 notes
    %contained in 3 octaves, played on a classical guitar. This data will
    %be cross examined with the results of pitch detection to attain the
    %best possible note attribution. It also adds some bits of information
    %to the attributed notes, such as octave and sharp or not, for the
    %drawing phase.
    
    PS = envelop_maker();
    [notes res1] = envelop_matcher(match,onsets_samples,PS,x);
    
    notes = notes(:,1);   %random
    
        
end