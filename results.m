function result = results(notes,onsets_samples,fs)
    result = cell(length(notes),2);

    time = onsets_samples/fs;

    for i = 1:length(notes)
       result{i,1} = time(i);
        
       
       if notes(i) == 0          %e2
          result{i,2} =  'e2';   
       elseif notes(i) == 1      %f2
           result{i,2} =  'f2';
       elseif notes(i) == 2      %f#2
           result{i,2} =  'f#2';
       elseif notes(i) == 3      %g2
           result{i,2} =  'g';
       elseif notes(i) == 4      %g#2
           result{i,2} =  'g#2';
       elseif notes(i) == 5      %a2
           result{i,2} =  'a2';
       elseif notes(i) == 6      %a#2
           result{i,2} =  'a#2';
       elseif notes(i) == 7      %b2
           result{i,2} =  'b2';
       elseif notes(i) == 8      %c2
           result{i,2} =  'c2';
       elseif notes(i) == 9     %f2
           result{i,2} =  'c#2';
       elseif notes(i) == 10     %f2
           result{i,2} =  'd2';
       elseif notes(i) == 11     %f2
           result{i,2} =  'd#2';
       elseif notes(i) == 12     %f2
           result{i,2} =  'e3';
       elseif notes(i) == 13     %f2
           result{i,2} =  'f3';
       elseif notes(i) == 14     %f2
           result{i,2} =  'f#3';
       elseif notes(i) == 15     %f2
           result{i,2} =  'g3';
       elseif notes(i) == 16     %f2
           result{i,2} =  'g#3';
       elseif notes(i) == 17     %f2
           result{i,2} =  'a3';
       elseif notes(i) == 18     %f2
           result{i,2} =  'a#3';
       elseif notes(i) == 19     %f2
           result{i,2} =  'b3';
       elseif notes(i) == 20     %f2
           result{i,2} =  'c3';
       elseif notes(i) == 21     %f2
           result{i,2} =  'c#3';
       elseif notes(i) == 22     %f2
           result{i,2} =  'd3';
       elseif notes(i) == 23     %f2
           result{i,2} =  'd#3';
       elseif notes(i) == 24     %f2
           result{i,2} =  'e4';
       elseif notes(i) == 25     %f2
           result{i,2} =  'f4';
       elseif notes(i) == 26     %f2
           result{i,2} =  'f#4';
       elseif notes(i) == 27     %f2
           result{i,2} =  'g4';
       elseif notes(i) == 28     %f2
           result{i,2} =  'g#4';
       elseif notes(i) == 29     %f2
           result{i,2} =  'a4';
       elseif notes(i) == 30     %f2
           result{i,2} =  'a#4';    
       elseif notes(i) == 31     %f2
           result{i,2} =  'b4';
       elseif notes(i) == 32     %f2
           result{i,2} =  'c4';
       elseif notes(i) == 33     %f2
           result{i,2} =  'c#4';
       elseif notes(i) == 34     %f2
           result{i,2} =  'd4';  
       elseif notes(i) == 35     %f2
           result{i,2} =  'd#4'; 
       end
      
    end
    
end