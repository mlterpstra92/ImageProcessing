function image = readDoubleImage(title)    
    image = double(imread(['../Images/images/' title, '.tif']));
end