% Names of all the directories which contain images to build a panorama
% out of them
directories = {'my_pictures', 'my_guitar', 'mov2', 'mov3'};

for i = 1:numel(directories)
        % Getting the directory name
        directory = directories{i};
        disp(directory);
        
        % Calling a helper function to create the panorama image
        pano = hw3_helper(directory);
        
        % displaying and saving the panorama image
        imshow(pano);
        imwrite(pano,strcat(directory, '_pano.jpg'));
end

