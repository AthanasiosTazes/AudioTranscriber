function [slope,offset] = my_ls(data,yaxis,no)
    %Inputs
    %yaxis - time axis
    %data - data to be linearly regressed
    %Outpus
    %no - length of regression
    %Performs linear regression of the data entered.
    y = yaxis;
    
    sy = sum(y);
    sx = sum(data);
    sx2 = sum(data.^2);
    sxy = sum(y.*data);

    slope = (sxy - (sx*sy)/no)/(sx2 - (sx^2)/no);
    offset = (sy - slope*sx)/no;
end