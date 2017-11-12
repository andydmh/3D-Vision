function images = load_images(directory)
    % Loading all the images on the directory.
    directory = strcat(directory, '/');
    imagefiles = dir(strcat(directory,'*.jpg'));
    nfiles = length(imagefiles);
    
    for i = 1:nfiles
        currentfilename = imagefiles(i).name;
        img = imread(strcat(directory, currentfilename));
        images(:,:,:,i) = im2single(img);
    end
end