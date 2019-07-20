function kek = translator(lol)      
    %Inputs
    %lol - notes on frequences
    %Outputs
    %kek - number of notes
    %This function transforms the frequencies detected into notes from 1 to
    %36 corresponding to the 36 notes of 3 octaves.

    %------------------KEK-------------------------------------------------
    kek = -ones(length(lol),3);
    for k = 1:3
        for j = 1:length(lol)
            if lol(j,k) > ((77.78+82.41)/2) && lol(j,k) < ((82.41+87.31)/2)
               kek(j,k) = 1;
            elseif lol(j,k) > ((82.41+87.31)/2) && lol(j,k) < ((87.31+92.50)/2)  
               kek(j,k) = 2;
            elseif lol(j,k) > ((87.31+92.50)/2) && lol(j,k) < ((92.50+98.0)/2)
               kek(j,k) = 3;
            elseif lol(j,k) > ((92.50+98.0)/2) && lol(j,k) < ((98.0+103.83)/2)
               kek(j,k) = 4;
            elseif lol(j,k) > ((98.0+103.83)/2) && lol(j,k) < ((103.83+110.0)/2)
               kek(j,k) = 5;
            elseif lol(j,k) > ((103.83+110.0)/2) && lol(j,k) < ((110.0+116.54)/2)
               kek(j,k) = 6; 
            elseif lol(j,k) > ((110.0+116.54)/2) && lol(j,k) < ((116.54+123.47)/2)
               kek(j,k) = 7; 
            elseif lol(j,k) > ((116.54+123.47)/2) && lol(j,k) < ((123.47+130.81)/2)
               kek(j,k) = 8;   
            elseif lol(j,k) > ((123.47+130.81)/2) && lol(j,k) < ((130.81+138.59)/2)
               kek(j,k) = 9;   
            elseif lol(j,k) > ((130.81+138.59)/2) && lol(j,k) < ((138.59+146.83)/2)
               kek(j,k) = 10;   
            elseif lol(j,k) > ((138.59+146.83)/2) && lol(j,k) < ((146.83+155.56)/2)
               kek(j,k) = 11;   
            elseif lol(j,k) > ((146.83+155.56)/2) && lol(j,k) < ((155.56+164.81)/2)
               kek(j,k) = 12;  
            elseif lol(j,k) > ((155.56+164.81)/2) && lol(j,k) < ((164.81+174.61)/2)
               kek(j,k) = 13;   
            elseif lol(j,k) > ((164.81+174.61)/2) && lol(j,k) < ((174.61+185.00)/2)
               kek(j,k) = 14;   
            elseif lol(j,k) > ((174.61+185.00)/2) && lol(j,k) < ((185.00+196.00)/2)
               kek(j,k) = 15;   
            elseif lol(j,k) > ((185.00+196.00)/2) && lol(j,k) < ((196.00+207.65)/2)
               kek(j,k) = 16;   
            elseif lol(j,k) > ((196.00+207.65)/2) && lol(j,k) < ((207.65+220.00)/2)
               kek(j,k) = 17;   
            elseif lol(j,k) > ((207.65+220.00)/2) && lol(j,k) < ((220.00+233.08)/2)
               kek(j,k) = 18;   
            elseif lol(j,k) > ((220.00+233.08)/2) && lol(j,k) < ((233.08+246.94)/2)
               kek(j,k) = 19;   
            elseif lol(j,k) > ((233.08+246.94)/2) && lol(j,k) < ((246.94+261.63)/2)
               kek(j,k) = 20;   
            elseif lol(j,k) > ((246.94+261.63)/2) && lol(j,k) < ((261.63+277.18)/2)
               kek(j,k) = 21;   
            elseif lol(j,k) > ((261.63+277.18)/2) && lol(j,k) < ((277.18+293.66)/2)
               kek(j,k) = 22;   
            elseif lol(j,k) > ((277.18+293.66)/2) && lol(j,k) < ((293.66+311.13)/2)
               kek(j,k) = 23;   
            elseif lol(j,k) > ((293.66+311.13)/2) && lol(j,k) < ((311.13+329.63)/2)
               kek(j,k) = 24;   
            elseif lol(j,k) > ((311.13+329.63)/2) && lol(j,k) < ((329.63+349.23)/2)
               kek(j,k) = 25;   
            elseif lol(j,k) > ((329.63+349.23)/2) && lol(j,k) < ((349.23+369.99)/2)
               kek(j,k) = 26;   
            elseif lol(j,k) > ((349.23+369.99)/2) && lol(j,k) < ((369.99+392.00)/2)
               kek(j,k) = 27;   
            elseif lol(j,k) > ((369.99+392.00)/2) && lol(j,k) < ((392.00+415.30)/2)
               kek(j,k) = 28;   
            elseif lol(j,k) > ((392.00+415.30)/2) && lol(j,k) < ((415.30+440.00)/2)
               kek(j,k) = 29;   
            elseif lol(j,k) > ((415.30+440.00)/2) && lol(j,k) < ((440.00+466.16)/2)
               kek(j,k) = 30;   
            elseif lol(j,k) > ((440.00+466.16)/2) && lol(j,k) < ((466.16+493.88)/2)
               kek(j,k) = 31;   
            elseif lol(j,k) > ((466.16+493.88)/2) && lol(j,k) < ((493.88+523.25)/2)
               kek(j,k) = 32;   
            elseif lol(j,k) > ((493.88+523.25)/2) && lol(j,k) < ((523.25+554.37)/2)
               kek(j,k) = 33;   
            elseif lol(j,k) > ((523.25+554.37)/2) && lol(j,k) < ((554.37+587.33)/2)
               kek(j,k) = 34;   
            elseif lol(j,k) > ((554.37+587.33)/2) && lol(j,k) < ((587.33+622.25)/2)
               kek(j,k) = 35;   
            elseif lol(j,k) > ((587.33+622.25)/2) && lol(j,k) < ((622.25+659.25)/2)
               kek(j,k) = 36;    
            end
        end
    end
       
    kek =kek - 1;
end
        
        