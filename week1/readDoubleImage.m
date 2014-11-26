function image = readDoubleImage(title)    
    image = im2double(imread(['../Images/images/' title, '.tif']));
end