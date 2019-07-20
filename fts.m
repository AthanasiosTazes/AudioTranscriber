function [onsets onsets_frames onsets_values onsets_samples] = fts(onsets_function,xfiglen)

    onsets = zeros(xfiglen,1);         %length(x) samples onsets
    onsets_frames = find(onsets_function);          %frame index of onsets
    onsets_values = onsets_function(onsets_frames);    %values of onsets \
    onsets_samples = floor(onsets_frames.*(xfiglen/length(onsets_function))); 
    onsets(onsets_samples) = onsets_values; %onsets on signal

end