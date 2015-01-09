function image = readLogicalImage( path )
%READLOGICALIMAGE Summary of this function goes here
%   Detailed explanation goes here 
    image = imread(['../Images/images/' path, '.tif']);
end
